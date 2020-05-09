from robot.api.deco import keyword
import subprocess


ROBOT_AUTO_KEYWORDS = False

@keyword
def clear_employees_list(application_path):
    subprocess.run(['python3', application_path, 'remove_all_employees'], check=True)


@keyword
def retrieve_employees_list(application_path):
    process = subprocess.run(['python3', application_path, 'list_employees'], check=True, stdout=subprocess.PIPE, text=True)
    result = process.stdout.rstrip('\n')
    return result


@keyword
def add_employee(application_path, first_name, last_name):
    process = subprocess.run(['python3', application_path, 'add_employee', first_name, last_name], check=True,
                             stdout=subprocess.PIPE, text=True)
    result = process.stdout.rstrip('\n')
    return result