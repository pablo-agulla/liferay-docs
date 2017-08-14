/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
import UIKit


open class BaseListScreenlet: BaseScreenlet {
	
	open class var LoadInitialPageAction: String { return "load-initial-page" }
	open class var LoadPageAction: String { return "load-page" }


	//MARK: Inspectables
	
	@IBInspectable open var autoLoad: Bool = true
	
	@IBInspectable open var refreshControl: Bool = true {
		didSet {
			updateRefreshClosure()
		}
	}
	
	@IBInspectable open var firstPageSize: Int = 50

	@IBInspectable open var pageSize: Int = 25

	@IBInspectable open var obcClassName: String = ""
	
	open var baseListView: BaseListView {
		return screenletView as! BaseListView
	}
	
	internal var streamMode = false
	
	fileprivate var paginationInteractors: [Int:BaseListPageLoadInteractor] = [:]
	
	
	//MARK: BaseScreenlet
	
	override open func onCreated() {
		baseListView.onSelectedRowClosure = onSelectedRow
		baseListView.fetchPageForRow = loadPageForRow

		updateRefreshClosure()
	}
	
	override open func onShow() {
		if !isRunningOnInterfaceBuilder {
			if autoLoad {
				loadList()
			}
		}
	}
	
	override open func createInteractor(name: String, sender: AnyObject?) -> Interactor? {
		let page = (sender as? Int) ?? 0

		let interactor = createPageLoadInteractor(
			page: page,
			computeRowCount: (page == 0))
		
		
		paginationInteractors[page] = interactor

		interactor.obcClassName = (obcClassName == "") ? nil : obcClassName
		
		interactor.onSuccess = {
			self.baseListView.setRows(interactor.resultAllPagesContent!, newRows: interactor.resultPageContent!,
			                          rowCount: interactor.resultRowCount ?? self.baseListView.rowCount,
			                          sections: interactor.sections ?? [BaseListView.DefaultSection])

			self.onLoadPageResult(
				page: interactor.page,
				rows: interactor.resultPageContent?.map {$1}.flatMap {$0} ?? [],
				rowCount: self.baseListView.rowCount)
			
			self.paginationInteractors.removeValue(forKey: interactor.page)
		}
		
		interactor.onFailure = {
			self.onLoadPageError(page: interactor.page, error: $0)
			
			self.paginationInteractors.removeValue(forKey: interactor.page)
		}
		
		return interactor
	}
	
	override open func onAction(name: String, interactor: Interactor, sender: AnyObject?) -> Bool {
		
		if name == BaseListScreenlet.LoadInitialPageAction {
			// clear list while it's loading
			self.baseListView.clearRows()
		}
		
		return super.onAction(name: name, interactor: interactor, sender: sender)
	}
	
	
	//MARK: Public methods
	
	/// Starts the request to load the list of records.
	/// The list is shown when the response is received.
	///
	/// - Returns: true if the request is sent.
	@discardableResult
	open func loadList() -> Bool {
		//by default we start in fluent mode
		streamMode = false
		return performAction(name: BaseListScreenlet.LoadInitialPageAction, sender: nil)
	}
	
	/// Start the request to load the proper page for the given row.
	///
	/// - Parameter row: item row.
	open func loadPageForRow(_ row: Int) {
		let page = pageFromRow(row)
		
		// make sure we don't create two interactors for the same page
		synchronized(paginationInteractors as AnyObject) {
			if self.paginationInteractors.index(forKey: page) == nil {
				
				self.performAction(name: BaseListScreenlet.LoadPageAction, sender: page as AnyObject?)
			}
		}
	}
	
	/// Gets the page from the given row.
	///
	/// - Parameter row: item row.
	/// - Returns: item page.
	open func pageFromRow(_ row: Int) -> Int {
		if row < firstPageSize {
			return 0
		}
		
		return ((row - firstPageSize) / pageSize) + 1
	}
	
	/// Gets the first row for the given page.
	///
	/// - Parameter page: page number.
	/// - Returns: item row.
	open func firstRowForPage(_ page: Int) -> Int {
		if page == 0 {
			return 0
		}
		
		return firstPageSize + (page - 1) * pageSize
	}
	
	
	/// Prepares the page to be loaded in the list.
	/// This method is intended to be overridden by children classes.
	///
	/// - Parameters:
	///   - page: page number.
	///   - computeRowCount: true if we want to compute row count.
	/// - Returns: proper interactor.
	open func createPageLoadInteractor(
			page: Int,
			computeRowCount: Bool) -> BaseListPageLoadInteractor {
			
		fatalError("createPageLoadInteractor must be overriden")
	}
	
	/// Shows the error during page loading.
	/// This method is intended to be overridden by children classes.
	///
	/// - Parameters:
	///   - page: page number.
	///   - error: error on loading.
	open func onLoadPageError(page: Int, error: NSError) {
		print("ERROR: Load page error \(page) -> \(error)\n")
	}
	
	/// Gets the information about one page results.
	/// Call this method if you want to render the results.
	///
	/// - Parameters:
	///   - page: page number.
	///   - rows: page items.
	///   - rowCount: row count.
	open func onLoadPageResult(page: Int, rows: [AnyObject], rowCount: Int) {
	}
	
	/// Gets the information about one row.
	/// Call this method if you want to know what item list was selected.
	///
	/// - Parameter row: selected row.
	open func onSelectedRow(_ row:AnyObject) {
	}


	//MARK: Internal methods

	internal func updateRefreshClosure() {

		let refreshClosure: ((Void) -> Bool)? = refreshControl ? self.loadList : nil

		if let screenletView = screenletView as? BaseListTableView {
			screenletView.refreshClosure = refreshClosure
		}
		else if let screenletView = screenletView as? BaseListCollectionView {
			screenletView.refreshClosure = refreshClosure
		}
	}
}