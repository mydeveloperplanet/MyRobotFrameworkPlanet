from robot.api.deco import keyword
import subprocess

ROBOT_AUTO_KEYWORDS = False

@keyword
def clear_employees_list(application_path):
    subprocess.run(['python3', application_path, 'remove_all_employees'], check=True)
