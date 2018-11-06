# Creating and Editing Files with Google Docs

The Documents and Media Library lets you use Google Docs to create and edit text 
documents, spreadsheets, or presentations. When you finish your editing session, 
your changes are automatically saved in the Documents and Media Library. 

## Creating Files

Follow these steps to create a new Documents and Media file via Google Docs:

1.  Open the *Menu* 
    (![Product Menu](../../../../images/icon-menu.png)), 
    click on your site's name, and navigate to *Content* &rarr; 
    *Documents and Media*. 

2.  Click the *Add* icon 
    (![Add](../../../../images/icon-add.png)) 
    and select the type of Google document to add to the Document Library. You 
    can select Google Docs Document, Google Docs Presentation, or Google Docs 
    Spreadsheet. Once you select one of these options, @product@ creates a 
    temporary file in Documents and Media, links it to a new Google Docs file, 
    and then redirects you to that Google Docs file. Note that some actions on 
    this temporary Documents and Media file can affect its linked Google Docs 
    file. For more information, see the section below on 
    [multiple editing sessions](liferay.com). 

    ![Figure 1: Select the type of Google document you want to create.](../../../../images/google-docs-new.png)

3.  Use the Google Docs editor to create your document's content. Except for 
    sharing, all Google Docs features are available for you to use. 

4.  Save or discard your changes in Google Docs. You can do this by clicking one 
    of these buttons in the toolbar that appears on top of the editor in Google 
    Docs: 

    -   **Save and Return to Liferay:** Saves your document as a new file in the 
        Documents and Media Library. This also deletes the file in Google Docs, 
        because Google Docs is only used for editing. The file's format in the 
        Documents and Media Library depends on the type of Google Document you 
        selected in the second step: 

        -   Google Docs Document: Microsoft Word (`.docx`)
        -   Google Docs Presentation: Microsoft PowerPoint (`.pptx`)
        -   Google Docs Spreadsheet: Microsoft Excel (`.xlsx`)

    -   **Discard Changes:** Returns you to the portal without saving your file 
        in the Documents and Media Library or Google Docs. 

    Note that it's also possible to close the Google Docs window without 
    clicking either button. In this case, the editing session remains open even 
    though the window that initiated it is closed. For more information, see the 
    section below on 
    [multiple editing sessions](liferay.com). 

    ![Figure 2: Save or discard your changes using the toolbar at the top of the Google Docs editor.](../../../../images/google-docs-save-discard.png)

## Editing Files

You can use Google Docs to edit existing files in the Documents and Media 
Library. The Documents and Media Library currently lets you edit the following 
file types in Google Docs: 

-   Plain text documents
-   LibreOffice documents
-   Newer, XML-based Microsoft Office documents (`.docx`, `.pptx`, `.xlsx`). 
    Note that Google Docs doesn't support Older Microsoft Office file types. 

Follow these steps to edit a Documents and Media file in Google Docs: 

1.  Navigate to the file in the Documents and Media Library. 

2.  Click the file's Actions icon 
    (![Actions](../../../../images/icon-actions.png)) 
    and select *Edit in Google Docs*. This automatically 
    [checks out](/discover/portal/-/knowledge_base/7-2/checking-out-and-editing-files) 
    the file in @product@, transfers its content to a new file in Google Docs, 
    and redirects you to that Google Docs file. 

    ![Figure 3: Select *Edit in Google Docs* from the file's Actions menu.](../../../../images/google-docs-edit.png)

3.  Edit the file in Google Docs. The editing process is exactly the same as 
    described above for creating files. 

## Multiple Editing Sessions

When you create or edit a Documents and Media file in Google Docs, you can save 
or discard your changes by clicking *Save and Return to Liferay* or 
*Discard Changes*, respectively. But what if you instead close the Google Docs 
window without clicking either? Don't worry---this won't tear the fabric of 
spacetime. Because you didn't explicitly save or discard your changes, you can 
access them via the original file in the Documents and Media Library. If this 
file didn't exist before (e.g., you were creating a new file), it appears in the 
Documents and Media Library as a temporary file. 

The following actions are available via the Documents and Media file's Actions 
icon 
(![Actions](../../../../images/icon-actions.png)): 

-   **Edit in Google Docs:** Resume editing the file in Google Docs.

-   **Check in:** Saves the Google Docs file (including any changes) to the 
    Documents and Media file, then deletes Google Docs file. Note that this
    this action is equivalent to clicking *Save and Return to Liferay* in a 
    Google Docs editing session. 

-   **Cancel Checkout:** Discards any changes to the Google Docs file, then 
    deletes it. Note that this action is equivalent to clicking 
    *Discard Changes* in a Google Docs editing session. 

## Related Topics


