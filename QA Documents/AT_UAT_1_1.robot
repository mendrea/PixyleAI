*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot

*** Test Cases ***

Automatic Tagging Landing Page
	[Tags]   AT_UAT_1_1
	Generic_Commands.Run Pixyle Automatic Tagging in web browser
	Validations.Pixyle Automatic Tagging landing page

Login with valid credentials	
	Login as [FrontEnd] with password [Frontend123#]
	
Collection list buttons
	Ensure that element is visible  //input[@placeholder='Search by product ID']
	Top button [Start Tagging] is available
	Top button [Export Collection] is available
	Top button [Rename] is available
	Ensure that element is visible  //button[@class='topButtonsL'][contains(.,'Delete')]
	
	Table with the following columns is shown [Name] [#Images] [Uploaded images] [Tagged images] [Verified images] [Date]

Left menu items
	Left menu item [My Collections] is available
	Left menu item [Account Settings] is available
	Left menu item [Upload Images] is available
	
Upload a collection from local project
	I click the button [Upload Images]
	Ensure that element is visible  //h3[contains(.,'Drop Your ZIP / CSV File Here')] 
	SeleniumLibrary.Choose File  //input[@type='file']  ${Collection_Path}
	
Verify that file has been uploaded
	Ensure that element is visible  //h3[contains(.,'We are downloading your images...')]
	SeleniumLibrary.Wait Until Element Is Not Visible  //h3[contains(.,'We are downloading your images...')]
	Ensure that element is visible  //a[.='QA_collection']
	
Select QA_collection from the dashboard
	Ensure that element is visible  //a[.='QA_collection']
	SeleniumLibrary.Click Element  //a[contains(.,'QA_collection')]
	Generic_Commands.Wait for Ajax

Verify that Jeans Jackets T-shirts Ss and Sweat Pants are available
	Ensure that element is visible  //div[@class='header'][.='jeans']
	Ensure that element is visible  //div[@class='header'][.='jackets']
	Ensure that element is visible  //div[@class='header'][.='t-shirts ss']
	Ensure that element is visible  //div[@class='header'][.='sweat pants']
	
Navigate back to dashboard
	SeleniumLibrary.Click Element  //button[contains(.,'Back to Dashboard')]
	Wait for Ajax
	Ensure that element is visible  //a[.='QA_collection']
	
Delete uploaded collection
	SeleniumLibrary.Select Checkbox  //a[.='QA_collection']/../../..//*[@id='checkbox']
	SeleniumLibrary.Click Element  //button[@class='topButtonsL'][contains(.,'Delete')]
	Ensure that element is visible  //div[@class='modal-content']

Confirm the delete
	Ensure that element is visible  //div[@class='modal-content']//h5[.='Are you sure you want to delete this collection?']
	Ensure that element is visible  //div[@class='modal-content']//button[.='Yes']
	SeleniumLibrary.Click Element  //div[@class='modal-content']//button[.='Yes']
	
Ensure that collection has been deleted
	SeleniumLibrary.Wait Until Element Is Not Visible  //a[.='QA_collection']

Log Out
	Log out current User

User has landed on Login page
	Validations.Pixyle Automatic Tagging landing page
	[Teardown]  Close all open browsers and clear cookies