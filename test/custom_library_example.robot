| *** Settings ***    |
| Documentation       | Test the employee Python script
| Library             | OperatingSystem
| Library             | library/employee_lib.py

| *** Variables ***   |
| ${APPLICATION_PATH} | ../employee.py

| *** Test Cases ***            |                 |
| Empty Employees List          | [Documentation] | Verify the output of an empty employees list
| | [Setup]                     | Clear Employees List | ${APPLICATION_PATH}
| | ${output} =                 | Retrieve Employees List | ${APPLICATION_PATH}
| | Should Be Equal As Strings  | ${output} | []

| Add Employee                  | [Documentation] | Verify adding an employee
| | [Setup]                     | Clear Employees List | ${APPLICATION_PATH}
| | Add Employee                | ${APPLICATION_PATH} | first_name=John | last_name=Doe
| | ${output} =                 | Retrieve Employees List | ${APPLICATION_PATH}
| | Should Be Equal             | ${output}       | ['John Doe']
| | [Teardown]                  | Clear Employees List | ${APPLICATION_PATH}