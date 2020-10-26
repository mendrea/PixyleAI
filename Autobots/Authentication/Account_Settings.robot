*** Settings ***

Resource	../../Keywords/Settings.robot
Resource	../../Keywords/Navigation.robot
Resource	../../Keywords/Generic_Commands.robot
Resource	../../Keywords/Validations.robot

*** Test Cases ***

Account Settings
	[Tags]   Account
	Generic_Commands.Run Pixyle Automatic Tagging in web browser
	Validations.Pixyle Automatic Tagging landing page
	
Login with valid credentials
	Login as [FrontEnd] with password [Frontend123#]
	Left menu item [Account Settings] is available
	
Select Account Settings
	SeleniumLibrary.Click Element  //button[.='Account Settings']
	
Verify Account Settings Parmaeters
	Ensure that element is visible  //p[.='Username']
	Ensure that element is visible  //p[.='Username']/../..//p[contains(.,'FrontEnd')]
	Ensure that element is visible  //p[.='E-mail']
	Ensure that element is visible  //p[.='E-mail']/../..//p[contains(.,'frontend@pixyle.com')]
	Ensure that element is visible  //p[.='Company']
	Ensure that element is visible  //p[.='Business Model']
	
Verify Change Password form
	Ensure that element is visible  //p[.='Change Password']
	Ensure that element is visible  //label[.='Old Password']/..//*[@id='oldPassword']
	Ensure that element is visible  //label[.='New Password']/..//*[@id='newPassword']
	Ensure that element is visible  //label[.='Repeat New Password']/..//*[@id='confirmNewPassword']
	Ensure that element is visible  //button[.='Change Password']

Click on the Change Password button
	SeleniumLibrary.Click Element  //button[.='Change Password']
	
Wrong Old Password error message appears
	Ensure that element is visible  //label[.='Wrong old password']
	
Reload page and verify that old password error message disapears
	Reload Page
	Wait for Ajax
	Ensure that the element is not visible  //label[.='Wrong old password']
	
Type wrong old password and click on Change Password
	SeleniumLibrary.Input Text  //label[.='Old Password']/..//*[@id='oldPassword']  WrongPass
	SeleniumLibrary.Click Element  //button[.='Change Password']
	Ensure that element is visible  //label[.='Wrong old password']
	Reload Page
	Wait for Ajax

Type correct Old Password and click on Change Password
	Ensure that element is visible  //label[.='Old Password']/..//*[@id='oldPassword']
	Ensure that element is visible  //label[.='New Password']/..//*[@id='newPassword']
	Ensure that element is visible  //label[.='Repeat New Password']/..//*[@id='confirmNewPassword']
	SeleniumLibrary.Input Text  //label[.='Old Password']/..//*[@id='oldPassword']  Frontend123#
	SeleniumLibrary.Click Element  //button[.='Change Password']
	
Password needs to be at least six characters error message appears
	Ensure that element is visible  //label[.='Password needs to be at least six characters']

Type incorrect New Password
	SeleniumLibrary.Input Text  //label[.='New Password']/..//*[@id='newPassword']  WrongNewPass
	SeleniumLibrary.Click Element  //button[.='Change Password']
	
Passwords do not match error message appears
	Ensure that element is visible  //label[.='Passwords do not match!']
	
Type correct New Password and incorrect Repeat New Password
	SeleniumLibrary.Input Text  //label[.='New Password']/..//*[@id='newPassword']  m3ng3l3
	SeleniumLibrary.Input Text  //label[.='Repeat New Password']/..//*[@id='confirmNewPassword']  WrongNewPass
	
Passwords do not match appear again
	Ensure that element is visible  //label[.='Passwords do not match!']

Log out
	Log out current User
	[Teardown]  Close all open browsers and clear cookies