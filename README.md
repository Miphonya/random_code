# NEED TO BE UPDATED


# random_code
This is just a simply repository in which I put various small pieces of code in many languages that I have created to solve problems of all kinds.
## Python
**csv2prtg** <br>
This Python 3.9 script allows you to retrieve elements from a CSV file and import them directly into PRTG using the REST API, based on an already created template object. <br>
<br>
The .CSV file should have a ";" as the separator and follow this column format:
|   Name   |  Address  |
|----------|-----------|
| CoolName | 172.0.0.1 |
## Java
**SumDifferenceProductQuotient :** <br>
This Java code prompts the user to enter two integers using a Scanner object, then calculates their sum, difference, product, and quotient (integer division). The results are displayed on the screen as text using the System.out.print() method.

## PHP
**Hexa2Decimal :** <br>
This HTML/PHP code allows the user to enter a hexadecimal value in a text field and convert it to decimal. When the user clicks the submit button, the value of the text field is retrieved in PHP, converted to decimal using the hexdec() function, and the result is displayed on the HTML page. The HTML code displays a form with a text field and a submit button. The PHP code retrieves the value entered by the user and performs the conversion calculation. The result is then displayed on the HTML page. The entire code is executed on an Apache server.

## PowerShell
**Folder2ZIP :** <br>
This code is a PowerShell script that takes two parameters, the path of an input folder and the path of an output folder, and compresses each subfolder in the input folder using the Compress-Archive cmdlet.
The $subfolders variable retrieves all the subfolders in the specified input folder. The ForEach loop iterates through each subfolder, gets its name, creates a new zip file using that name and the specified output folder path, and then compresses all files and subfolders in the subfolder using the Compress-Archive cmdlet. The script also displays progress information using the Write-Host cmdlet.
The final code executes the Compress-Subfolders function using test paths for the input and output folders.

**MyCleanEdge :** <br>
This code deletes the registry key that controls the Edge search browser and removes the message "Your browser is managed by your organization". Then, it restarts Edge.

**ActiveDirectoryMoveOU :** <br>
This code allows you to easily and quickly move all objects from an Active Directory OU recorded in a CSV file to another OU.

## VBA
**Scanner :** <br>
This code defines a subroutine named "Scanner" that loops through rows 2 to 1000 of a worksheet named "Data". It reads the values in columns A and B of each row and checks if the value in column A (sSalle) is different from the value in the previous row (sPreviousSalle). If they are different, the subroutine writes the data in columns K and L of a worksheet named "Main", starting at row iDefaultLigne. If they are the same, the subroutine continues writing data in the next row of the same group. The subroutine also calls a function named "data_to_text_file" to write the data to a text file, and displays a message box when it is finished. The code contains some comments to explain the purpose of each section and give some warnings. <br>
