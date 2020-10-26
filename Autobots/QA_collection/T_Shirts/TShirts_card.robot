*** Settings ***

Resource	../../../Keywords/Settings.robot
Resource	../../../Keywords/Navigation.robot
Resource	../../../Keywords/Generic_Commands.robot
Resource	../../../Keywords/Validations.robot

*** Test Cases ***

T-Shirts card verification 
	[Tags]   Collection  T-shirts
	Generic_Commands.Run Pixyle Automatic Tagging in web browser
	Validations.Pixyle Automatic Tagging landing page
	Login as [FrontEnd] with password [Frontend123#]
	Left menu item [My Collections] is available
	Left menu item [Account Settings] is available
	Left menu item [Upload Collection] is available
	Table with the following columns is shown [Name] [#Products] [Uploaded products] [Tagged products] [Verified products] [Date]
	Ensure that element is visible  //input[@placeholder='Search by product ID']
	
Verify Collections List Buttons
	Top button [Add Products] is available
	Top button [Export] is available
	Top button [Rename] is available
	Ensure that element is visible  //button[@class='topButtonsL'][contains(.,'Delete')]
	
Upload New Collection
	Upload the QA_collection file
	Verify that QA_Collection products have been uploaded successfully
	Verify that QA_Collection products have been tagged successfully
	Select the [QA_collection] collection from the dashboard	
	Verify that the card with header [t-shirts ss] shows [0] out of [2] images verified
	Select [t-shirts ss] from the collection
	
Verify First T-Shirt Properties
	Select the first jeans category - REFACTOR
	Verify T Shirt Property - Collar
	Verify T Shirt Property - Sleeve Length
	Verify T Shirt Property - Tops Length
	Verify T Shirt Property - Color
	Verify T Shirt Property - Pattern
	
Verify T-Shirts Product
	SeleniumLibrary.Click Element  //button[.='Verify Product']
	Wait for Ajax
	Ensure that element is visible  //button[.='Verify Product']
	SeleniumLibrary.Click Element  //button[.='Verify Product']
	
First T-Shirt Product has been Verified
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[1]//p[.='Verified']
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[2]//p[.='Verified']
	Go back to Collection
	
First T-Shirt Product is Verified
	Verify that the current collection is [25]% verified
	Verify that the card with header [t-shirts ss] shows [2] out of [2] images verified
	
Back to Dashboard
	Go back to Dashboard
	Within the dashboard the [QA_collection] collection is shown
	
Delete the collection
	Delete the [QA_collection] collection
	
Log Out
	Log out current User
	[Teardown]  Close all open browsers and clear cookies