| *** Settings ***   |
| Documentation      | Test the employee Python script
| Library            | OperatingSystem
| Resource           | data/employee.resource

| *** Test Cases ***            |                 |
| Empty Employees List          | [Documentation] | Verify the output of an empty employees list
| | [Setup]                     | Clear Employees List
| | ${output} =                 | Retrieve Employees List
| | Should Be Equal             | ${output}       | []

| Add Employee                  | [Documentation] | Verify adding an employee
| | [Setup]                     | Clear Employees List
| | Add Employee                | first_name=John | last_name=Doe
| | ${output} =                 | Retrieve Employees List
| | Should Be Equal             | ${output}       | ['John Doe']
| | [Teardown]                  | Clear Employees List