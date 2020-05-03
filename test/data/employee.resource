| *** Settings ***   |
| Documentation      | Resource for Employee interactions
| Library            | OperatingSystem

| *** Variables ***  |
| ${APPLICATION}     | python3 ../employee.py

| *** Keywords ***              |
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