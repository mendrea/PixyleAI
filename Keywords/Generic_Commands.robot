*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Validations.robot
Resource	../Keywords/Context.robot

*** Variables ***
${IsAjaxComplete}    ${EMPTY}

*** Keywords ***
  
Open Browser And Go To Login Page
    SeleniumLibrary.Open Browser  ${ServerName}  ${Browser}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed  0

Go back to Dashboard
	Ensure that element is visible  //button[contains(.,'Back to Dashboard')]
	SeleniumLibrary.Click Element  //button[contains(.,'Back to Dashboard')]
	Wait for Ajax
	
Go back to Collection
	Ensure that element is visible  //button[contains(.,'Back to Collection')]
	SeleniumLibrary.Click Element  //button[contains(.,'Back to Collection')]
	Wait for Ajax

Run Pixyle Automatic Tagging in web browser
	Open Browser And Go To Login Page
	Generic_Commands.Wait for Ajax
	
Login as [${USERNAME}] with password [${PASSWORD}]
	SeleniumLibrary.Input Text  //label[@for='username']/..//input  ${USERNAME}
	SeleniumLibrary.Input Text  //label[@for='password']/..//input  ${PASSWORD}
    SeleniumLibrary.Click Element  //button[@type='button'][.='Log me in']
    Generic_Commands.Wait for Ajax

Log out current User
	Ensure that element is visible  //div[@role='listbox']
	SeleniumLibrary.Click Element  //div[@role='listbox']
	Ensure that element is visible  //div[@role='listbox']//div[@role='option']//span[contains(.,'Log Out')]
	SeleniumLibrary.Click Element  //div[@role='listbox']//div[@role='option']//span[contains(.,'Log Out')]
	Generic_Commands.Wait for Ajax
	Validations.Pixyle Automatic Tagging landing page
	    
I click the button [${BTN}]
	Ensure that element is visible  //button[.='${BTN}']
	SeleniumLibrary.Click Element  //button[.='${BTN}']
	Generic_Commands.Wait for Ajax
	
I click the card with header [${HEADER_CLC}]
	SeleniumLibrary.Click Element  //div[@class='header'][.='${HEADER_CLC}']
	Wait for Ajax

Upload the QA_collection file
	I click the button [Upload Collection]
	Ensure that element is visible  //h3[contains(.,'Drop Your ZIP / CSV File Here')] 
	SeleniumLibrary.Choose File  //input[@type='file']  ${QA_collection}
	Wait for Ajax
	#Ensure that element is visible  //h3[contains(.,'Your file is being uploaded......')]
	#SeleniumLibrary.Wait Until Element Is Not Visible  //h3[contains(.,'Your file is being uploaded...')]
	Ensure that element is visible  //a[.='QA_collection']
	#SeleniumLibrary.Wait Until Page Contains Element  //p[.='QA_collection']/../../..//p[contains(.,'Tagging your images')]
	#SeleniumLibrary.Wait Until Element Is Not Visible  //p[.='QA_collection']/../../..//p[contains(.,'Tagging your images')]

Delete the [${COLLECTION_NAME}] collection
	SeleniumLibrary.Select Checkbox  //a[.='${COLLECTION_NAME}']/../../..//input[@name='checkbox']
	SeleniumLibrary.Click Element  //button[@class='topButtonsL'][contains(.,'Delete')]
	Ensure that element is visible  //div[@class='modal-content']
	Ensure that element is visible  //div[@class='modal-content']//h5[.='Are you sure you want to delete this collection?']
	Ensure that element is visible  //div[@class='modal-content']//button[.='Yes']
	SeleniumLibrary.Click Element  //div[@class='modal-content']//button[.='Yes']
	SeleniumLibrary.Wait Until Element Is Not Visible  //a[.='${COLLECTION_NAME}']

Select the [${COLLECTION_NAME}] collection from the dashboard
	Ensure that element is visible  //a[.='${COLLECTION_NAME}']
	SeleniumLibrary.Click Element  //a[contains(.,'${COLLECTION_NAME}')]
	Generic_Commands.Wait for Ajax
	
Select [${ITEM_NAME}] from the collection
	Ensure that element is visible  //div[@class='header'][.='${ITEM_NAME}']
	SeleniumLibrary.Click Element  //div[@class='header'][.='${ITEM_NAME}']
	Generic_Commands.Wait for Ajax
  
Select the first jeans category - REFACTOR
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[1]
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[1]//p[.='Pending']
	SeleniumLibrary.Click Element  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[1]
	Generic_Commands.Wait for Ajax
	Verify that the Clear Changes and Verify Product buttons are avaialble
	
Select the second jeans category - REFACTOR
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[2]
	SeleniumLibrary.Click Element  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[2]
	Generic_Commands.Wait for Ajax
	Verify that the Clear Changes and Verify Product buttons are avaialble 

Close the dialog window
	SeleniumLibrary.Click Element  //i[@class='close icon']
	Wait for Ajax

Wait for Ajax
  	#: FOR    ${INDEX}    IN RANGE    1    5000
    #\    ${IsAjaxComplete}    Execute JavaScript    return window.jQuery!=undefined && jQuery.active==0
    #\    Log    ${INDEX}
    #\    Log    ${IsAjaxComplete}
    #\    Run Keyword If    ${IsAjaxComplete}==True    Exit For Loop
	SeleniumLibrary.Execute JavaScript  "return jQuery.active == 0"
	Sleep  0.5
    #Wait for Condition  return window.jQuery.active == 0;
    #Wait for Condition  return $(':animated').length == 0;
	
Close all open browsers and clear cookies
	SeleniumLibrary.Delete All Cookies
	SeleniumLibrary.Close All Browsers