| *** Settings ***   |
| Documentation      | Test the employee Python script, data driven approach
| Library            | OperatingSystem

| *** Variables ***  |
| ${APPLICATION}     | python3 ../employee.py

| *** Test Cases ***            |                 |
| Empty Employees List          | [Documentation] | Verify the output of an empty employees list
| | [Setup]                     | Clear Employees List
| | ${output} =                 | Retrieve Employees List
| | Should Be Equal             | ${output}       | []

| Add Employee                  | [Documentation] | Verify adding an employee
| | [Template]                  | Add Employee Template
| | first_name=John             | last_name=Doe
| | first_name=Monty            | last_name=Python
| | first_name=Knight           | last_name=Ni

| *** Keywords ***              |
| Add Employee Template         | [Documentation] | Template for verifying adding an employee
|                               | [Arguments]     | ${first_name}
|                               | ...             | ${last_name}
| |                             | Clear Employees List
| | Add Employee                | first_name=${first_name} | last_name=${last_name}
| | ${output} =                 | Retrieve Employees List
| | Should Be Equal             | ${output}       | ['${first_name} ${last_name}']
| | [Teardown]                  | Clear Employees List

| Clear Employees List          | [Documentation] | Clears the list of employees
| | ${rc}                       | ${output} =     | Run and Return RC and Output | ${APPLICATION} remove_all_employees
| | Should Be Equal As Integers | ${rc}           | 0

| Retrieve Employees List       | [Documentation] | Return the list of employees
| | ${rc}                       | ${output} =     | Run and Return RC and Output | ${APPLICATION} list_employees
| | Should Be Equal As Integers | ${rc}           | 0
| | [Return]                    | ${output}

| Add Employee                  | [Documentation] | Add an employee to the list of employees
|                               | [Arguments]     | ${first_name}
|                               | ...             | ${last_name}
| | ${rc}                       | ${output} =     | Run and Return RC and Output | ${APPLICATION} add_employee ${first_name} ${last_name}
| | Should Be Equal As Integers | ${rc}           | 0