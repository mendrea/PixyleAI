*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot
Library		JSONLibrary
Library 	String


*** Test Cases ***

Automatic Tagging Landing Page
	[Tags]   AT_UAT_1_1
	${RISE_VAL_OPTION} =  ""
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_rise_val}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jeans..rise.correct
	${demo}=  Convert JSON To String  ${jeans_rise_val}
	${ajdebreee}=  Get Substring  ${demo}  4  13
	Log  ${ajdebreee}
	
	
	Verify Jeans Property - Fit
	Verify Jeans Property - Wash
	Verify Jeans Property - Color
	Verify Jeans Property - Pattern
	SeleniumLibrary.Click Element  //button[.='Verify Product']
	Wait for Ajax
	Ensure that element is visible  //button[.='Verify Product']
	SeleniumLibrary.Click Element  //button[.='Verify Product']
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[1]//p[.='Verified']
	Ensure that element is visible  //div[@class='react-tabs__tab-panel react-tabs__tab-panel--selected']/div/div[2]//p[.='Verified']
	Go back to Collection
	Verify that the current collection is [25]% verified 
	Go back to Dashboard
	Within the dashboard the [QA_collection] collection is shown
	Delete the [QA_collection] collection
	Log out current User
	