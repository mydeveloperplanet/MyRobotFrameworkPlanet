| *** Settings ***   |
| Documentation      | Test the employee Python script, data driven approach
| Library            | OperatingSystem
| Library            | DataDriver | file=data_driver.csv | dialect=unix
| Test Setup         | Clear Employees List
| Test Teardown      | Clear Employees List
| Test Template      | Add Employee Template

| *** Variables ***  |
| ${APPLICATION}     | python3 ../employee.py

| *** Test Cases ***
| Add Employee ${first_name} ${last_name}

| *** Keywords ***              |
| Add Employee Template         | [Documentation] | Template for verifying adding an employee
|                               | [Arguments]     | ${first_name}
|                               | ...             | ${last_name}
| | Add Employee                | first_name=${first_name} | last_name=${last_name}
| | ${output} =                 | Retrieve Employees List
| | Should Be Equal             | ${output}       | ['${first_name} ${last_name}']

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