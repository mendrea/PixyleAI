*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot

*** Test Cases ***

Automatic Tagging Landing Page
	[Tags]   AT_UAT_1_2
	Generic_Commands.Run Pixyle Automatic Tagging in web browser
	Validations.Pixyle Automatic Tagging landing page

Login with valid credentials	
	Login as [FrontEnd] with password [Frontend123#]

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

Select Jeans	
	Ensure that element is visible  //div[@class='header'][.='jeans']
	SeleniumLibrary.Click Element  //div[@class='header'][.='jeans']
	Generic_Commands.Wait for Ajax
	
Select the first jeans category
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[1]
	SeleniumLibrary.Click Element  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[1]
	Generic_Commands.Wait for Ajax
	Verify that the Clear Changes and Verify Product buttons are avaialble

Verify for the first jeans category the attribute - Rise
	Attribute [rise] has default value of [mid rise]
	Item [rise] has the following options available [mid rise] [high rise] [low rise] [Remove]

Verify for the first jeans category the attribute - Fit	
	Attribute [fit] has default value of [skinny fit]
	Attribute [fit] has default value of [super slim fit]
	Attribute [fit] has default value of [slim fit]
	Attribute [fit] has default value of [regular fit]
	Attribute [fit] has default value of [super skinny fit]
	Attribute [fit] has default value of [straight fit]
	Attribute [fit] has default value of [relaxed fit]
	Attribute [fit] has default value of [tailored fit]
	Attribute [fit] has default value of [boyfriend fit]
	Attribute [fit] has default value of [loose fit]
	Attribute [fit] has default value of [flared fit]
	Attribute [fit] has default value of [wide leg fit]
	Attribute [fit] has default value of [jogger fit]
	Attribute [fit] has default value of [Remove]
	
Verify for the first jeans category the attribute - Wash
	Attribute [wash] has default value of [medium]
	Attribute [wash] has default value of [light]
	Attribute [wash] has default value of [dark]
	Attribute [wash] has default value of [damaged]
	Attribute [wash] has default value of [coloured]
	Attribute [wash] has default value of [Remove]
	
Verify for the first jeans category the attribute - Color
	Attribute [color] has default value of [blue]
	Attribute [color] has default value of [multicolor]
	Attribute [color] has default value of [gray]
	Attribute [color] has default value of [white]
	Attribute [color] has default value of [beige]
	Attribute [color] has default value of [black]
	Attribute [color] has default value of [ecru]
	Attribute [color] has default value of [green]
	Attribute [color] has default value of [red]
	Attribute [color] has default value of [pink]
	Attribute [color] has default value of [purple]
	Attribute [color] has default value of [orange]
	Attribute [color] has default value of [silver]
	Attribute [color] has default value of [brown]
	Attribute [color] has default value of [yellow]
	Attribute [color] has default value of [gold]
	Attribute [color] has default value of [Remove]
	
Verify for the first jeans category the attribute - Pattern
	Attribute [pattern] has default value of [bleached]
	Attribute [pattern] has default value of [plain]
	Attribute [pattern] has default value of [reversible]
	Attribute [pattern] has default value of [melange]
	Attribute [pattern] has default value of [logoprint]
	Attribute [pattern] has default value of [striped]
	Attribute [pattern] has default value of [dotted]
	Attribute [pattern] has default value of [lace]
	Attribute [pattern] has default value of [metallic]
	Attribute [pattern] has default value of [floral]
	Attribute [pattern] has default value of [checked]
	Attribute [pattern] has default value of [studded]
	Attribute [pattern] has default value of [paisley]
	Attribute [pattern] has default value of [animal]
	Attribute [pattern] has default value of [leopard]
	Attribute [pattern] has default value of [lurex]
	Attribute [pattern] has default value of [color block]
	Attribute [pattern] has default value of [leaf]
	Attribute [pattern] has default value of [glitter]
	Attribute [pattern] has default value of [chevron]
	Attribute [pattern] has default value of [ruffle]
	Attribute [pattern] has default value of [Remove]
	
Close the dialog window
	SeleniumLibrary.Click Element  //i[@class='close icon']
	Wait for Ajax
	Ensure that element is visible  //button[contains(.,'Back to Collection')]
	
Select the second jeans category
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[2]
	SeleniumLibrary.Click Element  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[2]
	Generic_Commands.Wait for Ajax
	
Ensure that the Clear Changes and Verify Product buttons are avaialble
	Ensure that element is visible  //button[.='Clear Changes']
	Ensure that element is visible  //button[.='Verify Product']

Verify for the second jeans category the attribute - Rise
	Attribute [rise] has default value of [mid rise]
	Item [rise] has the following values [mid rise] [high rise] [low rise] [Remove]

Verify for the second jeans category the attribute - Fit	
	Attribute [fit] has default value of [skinny fit]
	Attribute [fit] has default value of [super slim fit]
	Attribute [fit] has default value of [slim fit]
	Attribute [fit] has default value of [regular fit]
	Attribute [fit] has default value of [super skinny fit]
	Attribute [fit] has default value of [straight fit]
	Attribute [fit] has default value of [relaxed fit]
	Attribute [fit] has default value of [tailored fit]
	Attribute [fit] has default value of [boyfriend fit]
	Attribute [fit] has default value of [loose fit]
	Attribute [fit] has default value of [flared fit]
	Attribute [fit] has default value of [wide leg fit]
	Attribute [fit] has default value of [jogger fit]
	Attribute [fit] has default value of [Remove]
	
Verify for the second jeans category the attribute - Wash
	Attribute [wash] has default value of [medium]
	Attribute [wash] has default value of [light]
	Attribute [wash] has default value of [dark]
	Attribute [wash] has default value of [damaged]
	Attribute [wash] has default value of [coloured]
	Attribute [wash] has default value of [Remove]
	
Verify for the second jeans category the attribute - Color
	Attribute [color] has default value of [blue]
	Attribute [color] has default value of [multicolor]
	Attribute [color] has default value of [gray]
	Attribute [color] has default value of [white]
	Attribute [color] has default value of [beige]
	Attribute [color] has default value of [black]
	Attribute [color] has default value of [ecru]
	Attribute [color] has default value of [green]
	Attribute [color] has default value of [red]
	Attribute [color] has default value of [pink]
	Attribute [color] has default value of [purple]
	Attribute [color] has default value of [orange]
	Attribute [color] has default value of [silver]
	Attribute [color] has default value of [brown]
	Attribute [color] has default value of [yellow]
	Attribute [color] has default value of [gold]
	Attribute [color] has default value of [Remove]
	
Verify for the second jeans category the attribute - Pattern
	Attribute [pattern] has default value of [bleached]
	Attribute [pattern] has default value of [plain]
	Attribute [pattern] has default value of [reversible]
	Attribute [pattern] has default value of [melange]
	Attribute [pattern] has default value of [logoprint]
	Attribute [pattern] has default value of [striped]
	Attribute [pattern] has default value of [dotted]
	Attribute [pattern] has default value of [lace]
	Attribute [pattern] has default value of [metallic]
	Attribute [pattern] has default value of [floral]
	Attribute [pattern] has default value of [checked]
	Attribute [pattern] has default value of [studded]
	Attribute [pattern] has default value of [paisley]
	Attribute [pattern] has default value of [animal]
	Attribute [pattern] has default value of [leopard]
	Attribute [pattern] has default value of [lurex]
	Attribute [pattern] has default value of [color block]
	Attribute [pattern] has default value of [leaf]
	Attribute [pattern] has default value of [glitter]
	Attribute [pattern] has default value of [chevron]
	Attribute [pattern] has default value of [ruffle]
	Attribute [pattern] has default value of [Remove]
	
Close the dialog window for the second category
	SeleniumLibrary.Click Element  //i[@class='close icon']
	Wait for Ajax
	Ensure that element is visible  //button[contains(.,'Back to Collection')]
	
Navigate back to Collection
	SeleniumLibrary.Click Element  //button[contains(.,'Back to Collection')]
	Wait for Ajax
	Ensure that element is visible  //button[contains(.,'Back to Dashboard')]
	
Navigate back to Dashboard
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

Log out
	Log out
	
User has landed on Login page
	Validations.Pixyle Automatic Tagging landing page
	[Teardown]  Close all open browsers and clear cookies