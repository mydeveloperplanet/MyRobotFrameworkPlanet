*** Settings ***
| Documentation      | Example using the pipe separated plain text format.
| Library            | OperatingSystem


*** Variables ***
| ${MESSAGE}         | Hello, world!


*** Test Cases ***
| My Test            | [Documentation] | Example test
|                    | Log             | ${MESSAGE}
|                    | My Keyword      | /tmp

| Another Test       | [Documentation] | This is another test
|                    | Should Be Equal | ${MESSAGE}   | Hello, world!


*** Keywords ***
| My Keyword         | [Documentation]        | This is my keyword
|                    | [Arguments]            | ${path}
|                    | Directory Should Exist | ${path}
