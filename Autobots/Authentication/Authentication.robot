*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Test Cases ***

Automatic Tagging Landing Page
	[Tags]   Authentication
	Generic_Commands.Run Pixyle Automatic Tagging in web browser
	Validations.Pixyle Automatic Tagging landing page
	
Login without username and password
	Login as [${EMPTY}] with password [${EMPTY}]
	
Verify error message required username and password appears
	Ensure that element is visible  //div[@class='srv-validation-message'][.='The username field is required.']
	Ensure that element is visible  //div[@class='srv-validation-message'][.='The password field is required.']
	
Login with non existing username and existing password
	Login as [User123] with password [Frontend123#]
	
Verify dialog Username not found window appears
	Ensure that element is visible  //div[@class='modal-content']//h5[.='Username Not Found']
	Ensure that element is visible  //div[@class='modal-content']//button[.='OK']
	SeleniumLibrary.Click Element  //div[@class='modal-content']//button[.='OK']
	Generic_Commands.Wait for Ajax
	
Login with existing username and wrong password
	Login as [FrontEnd] with password [WRONGPASS]
	
Verify dialog with Incorrect Password Try Again Please appears
	Ensure that element is visible  //div[@class='modal-content']//h5[contains(.,'Incorrect Password, Try Again Please!')]
	Ensure that element is visible  //div[@class='modal-content']//button[.='OK']
	SeleniumLibrary.Click Button  //div[@class='modal-content']//button[.='OK']
	Generic_Commands.Wait for Ajax
	
AT Landing Page
	Validations.Pixyle Automatic Tagging landing page

Login with valid credentials	
	Login as [FrontEnd] with password [Frontend123#]

Verify User has logged in successfully
	Ensure that element is visible  //div[@role='listbox']
	Ensure that element is visible  //input[@placeholder='Search by product ID']
	
Log out
	Log out current User
	
#Verify that the user has logged out successfully
#	Ensure that element is visible  //p[contains(.,'You have been logged out successfuly')]
#	Ensure that element is visible  //button[@type='submit']//a[.='Log me in']
	
#Click on the Log me in button
#	SeleniumLibrary.Click Element  //button[@type='submit']//a[.='Log me in']
#	Generic_Commands.Wait for Ajax

User has landed on Login page
	Validations.Pixyle Automatic Tagging landing page
	[Teardown]  Close all open browsers and clear cookies