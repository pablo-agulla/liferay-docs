# Configuring Google Docs Integration

Before you can use Google Docs to create and edit Documents and Media Library 
files, you must configure @product@ to connect with an application in the 
[Google API Console](https://console.developers.google.com). 
Follow these steps to do so:

1.  Go to the
    [Google API Console](https://console.developers.google.com). 
    If you don't have a suitable project, 
    [create a new one](https://support.google.com/googleapi/answer/6251787?hl=en&ref_topic=7014522). 

2.  Enable the Google Drive API for your project. For instructions on this, see 
    the Google API Console documentation on 
    [enabling and disabling APIs](https://support.google.com/googleapi/answer/6158841). 

3.  Create an OAuth 2 client ID for your Google project. For instructions on 
    this, see the Google API Console documentation on 
    [setting up OAuth 2.0](https://support.google.com/googleapi/answer/6158849). 
    Select *Web application* when prompted to select your application type. Take 
    note of the client ID and client secret that appear---you'll need these 
    values in the next step. 

4.  Use the OAuth 2 client ID and client secret to configure Google Drive in 
    your @product@ instance. To do this, first go to *Control Panel* &rarr; 
    *Configuration* &rarr; *System Settings*. Select *Documents and Media*, then 
    select *Google Drive* under *SYSTEM SCOPE*. Enter the client ID and client 
    secret values from the previous step into their respective fields, then 
    click *Update*. 

    ![Figure 1: Enter your Google project's OAuth 2 client ID and client secret.](../../../../images/google-drive-system-settings.png)

That's it! Now your users can create and edit Documents and Media files online 
via Google Docs. Note that if you want to disable this feature, you can delete 
the client ID and client secret values from the form in the last step. 

## Related Topics

