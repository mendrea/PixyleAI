*** Settings ***
Library		SeleniumLibrary	timeout=60 s
Library		JSONLibrary
Library 	String

*** Variables ***
${ENVIRONMENT}		Pixyle Cloud

${BROWSER}				headlesschrome
${ServerName}			http://autotagdemo.s3-website.eu-central-1.amazonaws.com/
${DELAY}				0
${SETPIXYLEFRAME}		//iframe[@class='x-component x-fit-item x-component-default']
${PIXYLETITLE}			Visual AI for Fashion Retail
${QA_collection}		C:\\workspace\\Pixyle\\QA_collection.csv
${JSON_DATA}			C:\\workspace\\Pixyle\\autotag_multi_result.json