| *** Settings ***   |
| Documentation      | Test the employee Python script
| Library            | OperatingSystem

| *** Variables ***  |
| ${APPLICATION}     | python3 ../employee.py

| *** Test Cases ***            |                 |
| Empty Employees List          | [Documentation] | Verify the output of an empty employees list
| | ${rc}                       | ${output} =     | Run and Return RC and Output | ${APPLICATION} list_employees
| | Should Be Equal As Integers | ${rc}           | 0
| | Should Be Equal             | ${output}       | []