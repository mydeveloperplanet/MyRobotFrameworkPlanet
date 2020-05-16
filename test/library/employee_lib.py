""" Robot Framework library for the Employee application.

This library contains several entry points for accessing and testing the Python Employee script.
"""
from robot.api.deco import keyword
import subprocess

ROBOT_LIBRARY_VERSION = '0.1'
ROBOT_AUTO_KEYWORDS = False

@keyword
def clear_employees_list(application_path):
    """
    Clear the list of employees.

    Arguments:
    - ''application_path:''     The relative (or absolute) path where the Employee script resides\n

    Examples:
    | Clear Employees List | ../employee.py
    """
    subprocess.run(['python3', application_path, 'remove_all_employees'], check=True)


@keyword
def retrieve_employees_list(application_path):
    """
    Retrieve the list of employees.

    Arguments:
    - ''application_path:''     The relative (or absolute) path where the Employee script resides\n

    Examples:
    | Retrieve Employees List | ../employee.py
    """
    process = subprocess.run(['python3', application_path, 'list_employees'], check=True, stdout=subprocess.PIPE, text=True)
    result = process.stdout.rstrip('\n')
    return result


@keyword
def add_employee(application_path, first_name, last_name):
    """
    Add an employee.

    Arguments:
    - ''application_path:''     The relative (or absolute) path where the Employee script resides
    - ''first_name:''           The first name of the employee to be added.
    - ''last_name:''            The last name of the employee to be added.

    Examples:
    | Add Employee | ../employee.py | Monty | Python
    """
    subprocess.run(['python3', application_path, 'add_employee', first_name, last_name], check=True)