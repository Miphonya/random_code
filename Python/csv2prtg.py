# ------------------------------------------------------------------------ PYTHON 3.9 ------------------------------------------------------------------------

import csv  # Import the library to work with CSV files
import requests  # Import the library to make HTTP requests
import time  # Import the time library to manage waiting to avoid flooding
import re

# ---------------------------------VARIABLE--------------------------------------------
api_url = "https://prtg.exemple.com/api/"  # Link to the PRTG server
api_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"  # PRTG server API key

target_group = "XXXXXX"  # Destination group for imported elements
template_device = "XXXXXX"  # Template element for creating new elements
var_certif = "XXXXXXXXXXX/XXXX.crt"  # SSL certificate path
no_flood_pls = 1  # Add a sleep in seconds between each element to avoid flooding the PRTG server

# ---------- DON'T EDIT ----------
num_imp = 0  # Do not modify, used to count the number of imported elements

class bcolors:  # Do not modify, used to add colors to the CLI
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
# --------------------------------------------------------------------------------------

with open('XXXXXXXXXXXXXXXXXXXXX/XXXXX.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile, delimiter=';')
    total_objects = sum(1 for row in reader)  # Count the total number of objects in the CSV

# Reset the CSV file pointer
with open('XXXXXXXXXXXXXXXXXXXX/XXXXX.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile, delimiter=';')

    for row in reader:
        name = row['Name']
        address = row['Address']
        x = requests.get(
            f"{api_url}duplicateobject.htm?id={template_device}&name={name}&targetid={target_group}&host={address}&apitoken={api_key}",
            verify=var_certif)
        if x.status_code == 200:
            print(f"Code executed successfully for importing: {name} : {address}")
        else:
            print(f"{bcolors.WARNING}ERROR during the import of: {name} : {address}{bcolors.ENDC}")

        id = re.search(r'id=(\d+)', x.text).group(1)

        x = requests.get(api_url + "pause.htm?id=" + str(id) + "&action=1&apitoken=" + api_key,
                         verify=var_certif)
        if x.status_code == 200:
            num_imp += 1  # Increment the counter
            print(f"Code executed successfully for starting the object with ID {id}")
            print(f"Progress: {num_imp}/{total_objects}")
            print("-----------------------------------------------------------------------")
            time.sleep(no_flood_pls)

        else:
            print(f"{bcolors.WARNING}ERROR during starting the object with ID {id}{bcolors.ENDC}")
            print(f"{bcolors.WARNING}-----------------------------------------------------------------------{bcolors.ENDC}")
            time.sleep(no_flood_pls)
