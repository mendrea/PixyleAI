*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Context.robot

*** Keywords ***

Ensure that element is visible
	[Arguments]  ${elementXpathIdentifier}
	SeleniumLibrary.Wait Until Element Is Visible  ${elementXpathIdentifier}
	
Ensure that the element is not visible
	[Arguments]  ${elementXpathIdentifier}
	SeleniumLibrary.Page Should Not Contain Element  ${elementXpathIdentifier}
	
Verify that the current collection is [${NUMPERC}]% verified 
	Ensure that element is visible  //b[.='QA_collection']/../..//p[contains(.,'${NUMPERC}')]
    
Pixyle Automatic Tagging landing page
	Ensure that element is visible  //p[.='Welcome to Pixyle.ai - Automatic Tagging']
	Ensure that element is visible  //label[@for='username'][.='Username']
    Ensure that element is visible  //label[@for='username']/..//input
    Ensure that element is visible  //label[@for='password'][.='Password']
    Ensure that element is visible  //label[@for='password']/..//input
    Ensure that element is visible  //button[@type='button'][.='Log me in']
    
Left menu items are available
	Ensure that element is visible  //button[.='My Collections']
    Ensure that element is visible  //button[.='Account Settings']
    Ensure that element is visible  //button[.='Upload Images']
    
Table with the following columns is shown [${COL1}] [${COL2}] [${COL3}] [${COL4}] [${COL5}] [${COL6}]
	Ensure that element is visible  //th[.='${COL1}']
	Ensure that element is visible  //th[.='${COL2}']
	Ensure that element is visible  //th[.='${COL3}']
	Ensure that element is visible  //th[.='${COL4}']
	Ensure that element is visible  //th[.='${COL5}']
	Ensure that element is visible  //th[.='${COL6}']
    
Within the dashboard the [${COLLEECTION_ON_DSHB}] collection is shown
	Ensure that element is visible  //a[.='${COLLEECTION_ON_DSHB}']
    
Top button [${VAL}] is available
	Ensure that element is visible  //button[@class='topButtons'][contains(.,'${VAL}')]
    
Attribute [${ATTR}] has default value of [${ATTRVAL}]
	Ensure that element is visible  //label[.='${ATTR}']/..//select/option[1][.='${ATTRVAL}']
	#wait for devs to insert selected index
	
Item [${ATTR}] has the following options available [${ATTRVAL1}] [${ATTRVAL2}] [${ATTRVAL3}] [${ATTRVAL4}]
	Ensure that element is visible  //label[.='${ATTR}']/..//select/option[.='${ATTRVAL1}']
	Ensure that element is visible  //label[.='${ATTR}']/..//select/option[.='${ATTRVAL2}']
	Ensure that element is visible  //label[.='${ATTR}']/..//select/option[.='${ATTRVAL3}']
	Ensure that element is visible  //label[.='${ATTR}']/..//select/option[.='${ATTRVAL4}']
	
Left menu item [${LMI}] is available
	Ensure that element is visible  //button[.='${LMI}']
    
Verify that the Clear Changes and Verify Product buttons are avaialble
	Ensure that element is visible  //button[.='Clear Changes']
	Ensure that element is visible  //button[.='Verify Product']  
    
Verify that the card with header [${HDR}] shows [${NUM1}] out of [${NUM2}] images verified
	Ensure that element is visible  //div[@class='header'][.='${HDR}']/..//p[contains(.,'${NUM1}')]
	Ensure that element is visible  //div[@class='header'][.='${HDR}']/..//p[contains(.,'out of')]
	Ensure that element is visible  //div[@class='header'][.='${HDR}']/..//p[contains(.,'${NUM2}')]
	Ensure that element is visible  //div[@class='header'][.='${HDR}']/..//p[contains(.,'images verified')]
	Ensure that element is visible  //div[@class='header'][.='${HDR}']/..//img[@alt='Category_photo']

Verify that QA_Collection products have been uploaded successfully
	Ensure that element is visible  //a[.='QA_collection']/../../..//td[4]//div[@class='react-sweet-progress']
	Ensure that element is visible  //a[.='QA_collection']/../../..//td[4]//i[@class='check circle icon']
	
Verify that QA_Collection products have been tagged successfully
	Ensure that element is visible  //a[.='QA_collection']/../../..//td[5]//div[@class='react-sweet-progress']
	Ensure that element is visible  //a[.='QA_collection']/../../..//td[5]//i[@class='check circle icon']
	
### JEANS PROPERTIES ###

Verify Jeans Property - Rise
	### RISE = MID RISE
	${RISE_VAL_OPTION} =  Get Text  //label[.='rise']/..//select/option[1]
	${RISE_VAL_OPTION_STR} =  Convert To Lowercase  ${RISE_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_rise_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jeans..rise.correct
	${jeans_rise_val_json_to_str}=  Convert JSON To String  ${jeans_rise_val_json}
	${rise_json}=  Get Substring  ${jeans_rise_val_json_to_str}  4  12
	Should Be Equal As Strings  ${rise_json}  ${RISE_VAL_OPTION_STR}
	Attribute [rise] has default value of [mid-rise]
	Item [rise] has the following options available [mid-rise] [high-rise] [low-rise] [Remove]

Verify Jeans Property - Fit
	Attribute [fit] has default value of [skinny-fit]
	Ensure that element is visible  //label[.='fit']/..//select/option[.='skinny-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='super-slim-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='slim-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='super-skinny-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='straight-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='relaxed-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='tailored-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='boyfriend-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='loose-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='wide-leg-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='skinny-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='jogger-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='fit']/..//i[@class='plus icon']
	### FIT=SKINNY FIT
	${FIT_VAL_OPTION} =  Get Text  //label[.='fit']/..//select/option[1]
	${FIT_VAL_OPTION_STR} =  Convert To Lowercase  ${FIT_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_fit_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jeans..fit.correct
	${jeans_fit_val_json_to_str}=  Convert JSON To String  ${jeans_fit_val_json}
	${fit_json}=  Get Substring  ${jeans_fit_val_json_to_str}  4  14
	Should Be Equal As Strings  ${fit_json}  ${FIT_VAL_OPTION_STR}
    
Verify Jeans Property - Wash
	Attribute [wash] has default value of [medium]
	Ensure that element is visible  //label[.='wash']/..//select/option[.='light']
	Ensure that element is visible  //label[.='wash']/..//select/option[.='dark']
	Ensure that element is visible  //label[.='wash']/..//select/option[.='damaged']
	Ensure that element is visible  //label[.='wash']/..//select/option[.='coloured']
	Ensure that element is visible  //label[.='wash']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='wash']/..//i[@class='plus icon']
	### WASH=MEDIUM
	${WASH_VAL_OPTION} =  Get Text  //label[.='wash']/..//select/option[1]
	${WASH_VAL_OPTION_STR} =  Convert To Lowercase  ${WASH_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_wash_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jeans..wash.correct
	${jeans_wash_val_json_to_str}=  Convert JSON To String  ${jeans_wash_val_json}
	${wash_json}=  Get Substring  ${jeans_wash_val_json_to_str}  4  10
	Should Be Equal As Strings  ${wash_json}  ${WASH_VAL_OPTION_STR}
	
Verify Jeans Property - Color
	Attribute [color] has default value of [blue]
	Ensure that element is visible  //label[.='color']/..//select/option[.='multicolor']
	Ensure that element is visible  //label[.='color']/..//select/option[.='gray']
	Ensure that element is visible  //label[.='color']/..//select/option[.='white']
	Ensure that element is visible  //label[.='color']/..//select/option[.='beige']
	Ensure that element is visible  //label[.='color']/..//select/option[.='beige']
	Ensure that element is visible  //label[.='color']/..//select/option[.='black']
	Ensure that element is visible  //label[.='color']/..//select/option[.='ecru']
	Ensure that element is visible  //label[.='color']/..//select/option[.='green']
	Ensure that element is visible  //label[.='color']/..//select/option[.='red']
	Ensure that element is visible  //label[.='color']/..//select/option[.='pink']
	Ensure that element is visible  //label[.='color']/..//select/option[.='purple']
	Ensure that element is visible  //label[.='color']/..//select/option[.='orange']
	Ensure that element is visible  //label[.='color']/..//select/option[.='silver']
	Ensure that element is visible  //label[.='color']/..//select/option[.='brown']
	Ensure that element is visible  //label[.='color']/..//select/option[.='yellow']
	Ensure that element is visible  //label[.='color']/..//select/option[.='gold']
	Ensure that element is visible  //label[.='color']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='color']/..//i[@class='plus icon']
	### COLOR=BLUE
	${COLOR_VAL_OPTION} =  Get Text  //label[.='color']/..//select/option[1]
	${COLOR_VAL_OPTION_STR} =  Convert To Lowercase  ${COLOR_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_color_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jeans..color.correct
	${jeans_color_val_json_to_str}=  Convert JSON To String  ${jeans_color_val_json}
	${color_json}=  Get Substring  ${jeans_color_val_json_to_str}  4  8
	Should Be Equal As Strings  ${color_json}  ${COLOR_VAL_OPTION_STR}
	
Verify Jeans Property - Pattern
	Attribute [pattern] has default value of [bleached]
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='plain']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='reversible']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='melange']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='logoprint']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='striped']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='dotted']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='lace']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='metallic']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='floral']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='checked']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='studded']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='paisley']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='animal']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='leopard']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='color-block']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='leaf']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='glitter']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='chevron']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='ruffle']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='pattern']/..//i[@class='plus icon']
	### PATTERN=BLEACHED
	${PATTERN_VAL_OPTION} =  Get Text  //label[.='pattern']/..//select/option[1]
	${PATTERN_VAL_OPTION_STR} =  Convert To Lowercase  ${PATTERN_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_pattern_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jeans..pattern.correct
	${jeans_pattern_val_json_to_str}=  Convert JSON To String  ${jeans_pattern_val_json}
	${pattern_json}=  Get Substring  ${jeans_pattern_val_json_to_str}  4  12
	Should Be Equal As Strings  ${pattern_json}  ${PATTERN_VAL_OPTION_STR}
	
### JACKETS PROPERTIES ###
    
Verify Jacket Property - Collar
	### COLLAR=V NECK
	Attribute [collar] has default value of [v-neck]
	Ensure that element is visible  //label[.='collar']/..//select/option[.='v-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='notched-collar']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='classic']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='button-down']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='high-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='round-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='hoodie']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='shawl-collar']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='turtleneck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='off-shoulder']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='other']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='boat-neckline']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='sweetheart']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='square-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='collarless']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='crewneck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='cowl-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='grandad']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='collar']/..//i[@class='plus icon']
	${COLLAR_VAL_OPTION} =  Get Text  //label[.='collar']/..//select/option[1]
	${COLLAR_VAL_OPTION_STR} =  Convert To Lowercase  ${COLLAR_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jackets_collar_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jackets..collar.correct
	${jackets_collar_val_json_to_str}=  Convert JSON To String  ${jackets_collar_val_json}
	${collar_json}=  Get Substring  ${jackets_collar_val_json_to_str}  4  10
	Should Be Equal As Strings  ${collar_json}  ${COLLAR_VAL_OPTION_STR}
    
Verify Jacket Property - Sleeve Length
	### Sleeve Length=long sleeve
	Attribute [sleeve length] has default value of [long-sleeve]
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='long-sleeve']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='3/4-sleeve']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='medium-sleeve']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='sleeveless']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='short-sleeve']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='straps']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='strapless']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='sleeve length']/..//i[@class='plus icon']
	${SL_VAL_OPTION} =  Get Text  //label[.='sleeve length']/..//select/option[1]
	${SL_VAL_OPTION_STR} =  Convert To Lowercase  ${SL_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jackets_sl_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jackets..sleeve_length.correct
	${jackets_sl_val_json_to_str}=  Convert JSON To String  ${jackets_sl_val_json}
	${sl_json}=  Get Substring  ${jackets_sl_val_json_to_str}  4  15
	Should Be Equal As Strings  ${sl_json}  ${SL_VAL_OPTION_STR}
    
Verify Jacket Property - Length
	Attribute [jackets length] has default value of [medium]
	Ensure that element is visible  //label[.='jackets length']/..//select/option[.='medium']
	Ensure that element is visible  //label[.='jackets length']/..//select/option[.='short']
	Ensure that element is visible  //label[.='jackets length']/..//select/option[.='long']
	Ensure that element is visible  //label[.='jackets length']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='jackets length']/..//i[@class='plus icon']
	${LENGTH_VAL_OPTION} =  Get Text  //label[.='jackets length']/..//select/option[1]
	${LENGTH_VAL_OPTION_STR} =  Convert To Lowercase  ${LENGTH_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jackets_length_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jackets..jackets_length.correct
	${jackets_length_val_json_to_str}=  Convert JSON To String  ${jackets_length_val_json}
	${length_json}=  Get Substring  ${jackets_length_val_json_to_str}  4  10
	Should Be Equal As Strings  ${length_json}  ${LENGTH_VAL_OPTION_STR}   
    
Verify Jacket Property - Color
	Attribute [color] has default value of [black]
	Ensure that element is visible  //label[.='color']/..//select/option[.='black']
	Ensure that element is visible  //label[.='color']/..//select/option[.='multicolor']
	Ensure that element is visible  //label[.='color']/..//select/option[.='gray']
	Ensure that element is visible  //label[.='color']/..//select/option[.='white']
	Ensure that element is visible  //label[.='color']/..//select/option[.='blue']
	Ensure that element is visible  //label[.='color']/..//select/option[.='purple']
	Ensure that element is visible  //label[.='color']/..//select/option[.='red']
	Ensure that element is visible  //label[.='color']/..//select/option[.='brown']
	Ensure that element is visible  //label[.='color']/..//select/option[.='green']
	Ensure that element is visible  //label[.='color']/..//select/option[.='beige']
	Ensure that element is visible  //label[.='color']/..//select/option[.='silver']
	Ensure that element is visible  //label[.='color']/..//select/option[.='ecru']
	Ensure that element is visible  //label[.='color']/..//select/option[.='pink']
	Ensure that element is visible  //label[.='color']/..//select/option[.='yellow']
	Ensure that element is visible  //label[.='color']/..//select/option[.='orange']
	Ensure that element is visible  //label[.='color']/..//select/option[.='gold']
	Ensure that element is visible  //label[.='color']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='color']/..//i[@class='plus icon']
	${COLOR_VAL_OPTION} =  Get Text  //label[.='color']/..//select/option[1]
	${COLOR_VAL_OPTION_STR} =  Convert To Lowercase  ${COLOR_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jackets_color_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jackets..color.correct
	${jackets_color_val_json_to_str}=  Convert JSON To String  ${jackets_color_val_json}
	${color_json}=  Get Substring  ${jackets_color_val_json_to_str}  4  9
	Should Be Equal As Strings  ${color_json}  ${COLOR_VAL_OPTION_STR}
    
Verify Jacket Property - Pattern
	Attribute [pattern] has default value of [plain]
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='plain']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='ruffle']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='color-block']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='striped']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='dotted']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='checked']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='logoprint']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='lace']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='reversible']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='floral']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='studded']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='animal']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='leopard']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='metallic']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='chevron']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='leaf']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='melange']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='paisley']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='glitter']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='lurex']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='bleached']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='pattern']/..//i[@class='plus icon']
	${PATTERN_VAL_OPTION} =  Get Text  //label[.='pattern']/..//select/option[1]
	${PATTERN_VAL_OPTION_STR} =  Convert To Lowercase  ${PATTERN_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jackets_pattern_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..jackets..pattern.correct
	${jackets_pattern_val_json_to_str}=  Convert JSON To String  ${jackets_pattern_val_json}
	${pattern_json}=  Get Substring  ${jackets_pattern_val_json_to_str}  4  9
	Should Be Equal As Strings  ${pattern_json}  ${PATTERN_VAL_OPTION_STR}   
    
### T SHIRTS PROPERTIES ###

Verify T Shirt Property - Collar
	Attribute [collar] has default value of [round-neck]
	Ensure that element is visible  //label[.='collar']/..//select/option[.='round-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='crewneck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='button-down']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='grandad']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='classic']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='v-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='high-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='notched-collar']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='other']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='boat-neckline']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='off-shoulder']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='turtleneck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='hoodie']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='square-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='sweetheart']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='cowl-neck']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='collarless']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='shawl-collar']
	Ensure that element is visible  //label[.='collar']/..//select/option[.='Remove']
	${COLLAR_VAL_OPTION} =  Get Text  //label[.='collar']/..//select/option[1]
	${COLLAR_VAL_OPTION_STR} =  Convert To Lowercase  ${COLLAR_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${tshirts_collar_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..t-shirts_ss..collar.correct
	${tshirts_collar_val_json_to_str}=  Convert JSON To String  ${tshirts_collar_val_json}
	${collar_json}=  Get Substring  ${tshirts_collar_val_json_to_str}  4  14
	Should Be Equal As Strings  ${collar_json}  ${COLLAR_VAL_OPTION_STR}
	
Verify T Shirt Property - Sleeve Length
	Attribute [sleeve length] has default value of [short-sleeve]
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='short-sleeve']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='medium-sleeve']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='3/4-sleeve']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='sleeveless']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='long-sleeve']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='straps']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='strapless']
	Ensure that element is visible  //label[.='sleeve length']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='sleeve length']/..//i[@class='plus icon']

Verify T Shirt Property - Tops Length
	Attribute [tops length] has default value of [short]
	Ensure that element is visible  //label[.='tops length']/..//select/option[.='short']
	Ensure that element is visible  //label[.='tops length']/..//select/option[.='thigh-length']
	Ensure that element is visible  //label[.='tops length']/..//select/option[.='cropped']
	Ensure that element is visible  //label[.='tops length']/..//select/option[.='long']
	Ensure that element is visible  //label[.='tops length']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='tops length']/..//i[@class='plus icon']
	
Verify T Shirt Property - Color
	Attribute [color] has default value of [blue]
	Ensure that element is visible  //label[.='color']/..//select/option[.='blue']
	Ensure that element is visible  //label[.='color']/..//select/option[.='gray']
	Ensure that element is visible  //label[.='color']/..//select/option[.='multicolor']
	Ensure that element is visible  //label[.='color']/..//select/option[.='white']
	Ensure that element is visible  //label[.='color']/..//select/option[.='green']
	Ensure that element is visible  //label[.='color']/..//select/option[.='black']
	Ensure that element is visible  //label[.='color']/..//select/option[.='purple']
	Ensure that element is visible  //label[.='color']/..//select/option[.='orange']
	Ensure that element is visible  //label[.='color']/..//select/option[.='yellow']
	Ensure that element is visible  //label[.='color']/..//select/option[.='ecru']
	Ensure that element is visible  //label[.='color']/..//select/option[.='red']
	Ensure that element is visible  //label[.='color']/..//select/option[.='beige']
	Ensure that element is visible  //label[.='color']/..//select/option[.='pink']
	Ensure that element is visible  //label[.='color']/..//select/option[.='brown']
	Ensure that element is visible  //label[.='color']/..//select/option[.='silver']
	Ensure that element is visible  //label[.='color']/..//select/option[.='gold']
	Ensure that element is visible  //label[.='color']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='color']/..//i[@class='plus icon']
	${COLOR_VAL_OPTION} =  Get Text  //label[.='color']/..//select/option[1]
	${COLOR_VAL_OPTION_STR} =  Convert To Lowercase  ${COLOR_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${tshirts_color_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..t-shirts_ss..color.correct
	${tshirts_color_val_json_to_str}=  Convert JSON To String  ${tshirts_color_val_json}
	${color_json}=  Get Substring  ${tshirts_color_val_json_to_str}  4  8
	Should Be Equal As Strings  ${color_json}  ${COLOR_VAL_OPTION_STR}
	
Verify T Shirt Property - Pattern
	Attribute [pattern] has default value of [plain]
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='plain']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='melange']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='logoprint']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='striped']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='reversible']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='dotted']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='floral']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='bleached']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='checked']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='floral']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='paisley']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='lace']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='ruffle']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='leaf']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='metallic']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='chevron']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='color-block']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='studded']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='animal']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='leopard']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='lurex']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='glitter']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='pattern']/..//i[@class='plus icon']
	${PATTERN_VAL_OPTION} =  Get Text  //label[.='pattern']/..//select/option[1]
	${PATTERN_VAL_OPTION_STR} =  Convert To Lowercase  ${PATTERN_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${tshirts_pattern_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..t-shirts_ss..pattern.correct
	${tshirts_pattern_val_json_to_str}=  Convert JSON To String  ${tshirts_pattern_val_json}
	${pattern_json}=  Get Substring  ${tshirts_pattern_val_json_to_str}  4  9
	Should Be Equal As Strings  ${pattern_json}  ${PATTERN_VAL_OPTION_STR}   

### SWEAT PANTS PROPERTIES ###

Verify Sweat Pants Property - Rise
	### RISE = MID RISE
	${RISE_VAL_OPTION} =  Get Text  //label[.='rise']/..//select/option[1]
	${RISE_VAL_OPTION_STR} =  Convert To Lowercase  ${RISE_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_rise_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..sweat_pants..rise.correct
	${jeans_rise_val_json_to_str}=  Convert JSON To String  ${jeans_rise_val_json}
	${rise_json}=  Get Substring  ${jeans_rise_val_json_to_str}  4  12
	Should Be Equal As Strings  ${rise_json}  ${RISE_VAL_OPTION_STR}
	Attribute [rise] has default value of [mid-rise]
	Item [rise] has the following options available [mid-rise] [high-rise] [low-rise] [Remove]

Verify Sweat Pants Property - Fit
	Attribute [fit] has default value of [wide-leg-fit]
	Ensure that element is visible  //label[.='fit']/..//select/option[.='wide-leg-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='slim-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='regular-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='super-skinny-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='super-slim-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='boyfriend-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='loose-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='relaxed-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='tailored-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='straight-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='jogger-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='flared-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='skinny-fit']
	Ensure that element is visible  //label[.='fit']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='fit']/..//i[@class='plus icon']
	### FIT=SKINNY FIT
	${FIT_VAL_OPTION} =  Get Text  //label[.='fit']/..//select/option[1]
	${FIT_VAL_OPTION_STR} =  Convert To Lowercase  ${FIT_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_fit_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..sweat_pants..fit.correct
	${jeans_fit_val_json_to_str}=  Convert JSON To String  ${jeans_fit_val_json}
	${fit_json}=  Get Substring  ${jeans_fit_val_json_to_str}  4  16
	Should Be Equal As Strings  ${fit_json}  ${FIT_VAL_OPTION_STR}
	
Verify Sweat Pants Property - Color
	Attribute [color] has default value of [gray]
	Ensure that element is visible  //label[.='color']/..//select/option[.='gray']
	Ensure that element is visible  //label[.='color']/..//select/option[.='multicolor']
	Ensure that element is visible  //label[.='color']/..//select/option[.='silver']
	Ensure that element is visible  //label[.='color']/..//select/option[.='ecru']
	Ensure that element is visible  //label[.='color']/..//select/option[.='white']
	Ensure that element is visible  //label[.='color']/..//select/option[.='beige']
	Ensure that element is visible  //label[.='color']/..//select/option[.='green']
	Ensure that element is visible  //label[.='color']/..//select/option[.='blue']
	Ensure that element is visible  //label[.='color']/..//select/option[.='gold']
	Ensure that element is visible  //label[.='color']/..//select/option[.='black']
	Ensure that element is visible  //label[.='color']/..//select/option[.='pink']
	Ensure that element is visible  //label[.='color']/..//select/option[.='brown']
	Ensure that element is visible  //label[.='color']/..//select/option[.='purple']
	Ensure that element is visible  //label[.='color']/..//select/option[.='yellow']
	Ensure that element is visible  //label[.='color']/..//select/option[.='orange']
	Ensure that element is visible  //label[.='color']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='color']/..//i[@class='plus icon']
	### COLOR=BLUE
	${COLOR_VAL_OPTION} =  Get Text  //label[.='color']/..//select/option[1]
	${COLOR_VAL_OPTION_STR} =  Convert To Lowercase  ${COLOR_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_color_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..sweat_pants..color.correct
	${jeans_color_val_json_to_str}=  Convert JSON To String  ${jeans_color_val_json}
	${color_json}=  Get Substring  ${jeans_color_val_json_to_str}  4  8
	Should Be Equal As Strings  ${color_json}  ${COLOR_VAL_OPTION_STR}
	
Verify Sweat Pants Property - Pattern
	Attribute [pattern] has default value of [melange]
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='melange']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='lurex']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='metallic']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='logoprint']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='lace']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='striped']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='plain']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='bleached']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='animal']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='leopard']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='floral']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='ruffle']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='glitter']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='checked']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='dotted']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='leaf']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='studded']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='reversible']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='chevron']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='paisley']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='color-block']
	Ensure that element is visible  //label[.='pattern']/..//select/option[.='Remove']
	Ensure that element is visible  //label[.='pattern']/..//i[@class='plus icon']
	### PATTERN=BLEACHED
	${PATTERN_VAL_OPTION} =  Get Text  //label[.='pattern']/..//select/option[1]
	${PATTERN_VAL_OPTION_STR} =  Convert To Lowercase  ${PATTERN_VAL_OPTION}
	${jsondata}=  JSONLibrary.Load JSON From File  ${JSON_DATA}
	${jeans_pattern_val_json}=  JSONLibrary.Get Value From Json  ${jsondata}  $..sweat_pants..pattern.correct
	${jeans_pattern_val_json_to_str}=  Convert JSON To String  ${jeans_pattern_val_json}
	${pattern_json}=  Get Substring  ${jeans_pattern_val_json_to_str}  4  11
	Should Be Equal As Strings  ${pattern_json}  ${PATTERN_VAL_OPTION_STR}