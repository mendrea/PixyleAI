*** Settings ***

Resource	../../../Keywords/Settings.robot
Resource	../../../Keywords/Navigation.robot
Resource	../../../Keywords/Generic_Commands.robot
Resource	../../../Keywords/Validations.robot


*** Test Cases ***

Jeans card verification 
	[Tags]   Collection  Jeans
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
	Verify that the current collection is [0]% verified 
	Verify that the card with header [jeans] shows [0] out of [2] images verified
	Select [jeans] from the collection
	
Verify First Jeans Item Properties
	Select the first jeans category - REFACTOR
	Verify Jeans Property - Rise
	Verify Jeans Property - Fit
	Verify Jeans Property - Wash
	Verify Jeans Property - Color
	Verify Jeans Property - Pattern
	
Verify Jeans Product
	SeleniumLibrary.Click Element  //button[.='Verify Product']
	Wait for Ajax
	Ensure that element is visible  //button[.='Verify Product']
	SeleniumLibrary.Click Element  //button[.='Verify Product']
	
First Jeans Product has been Verified
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[1]//p[.='Verified']
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[2]//p[.='Verified']
	Go back to Collection
	Verify that the current collection is [25]% verified
	Verify that the card with header [jeans] shows [2] out of [2] images verified
	
Back to Dashboard
	Go back to Dashboard
	Within the dashboard the [QA_collection] collection is shown
	
Delete the collection
	Delete the [QA_collection] collection
	
Log out
	Log out current User
	[Teardown]  Close all open browsers and clear cookies