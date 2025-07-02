This batch file menu system provides a user-friendly interface to run batch files from a folder.


![image](https://github.com/user-attachments/assets/24dc715e-73ec-4401-b4a5-62dc0003ae09)

Here's how to use it:
Setup Instructions:

`https://github.com/marduk191/batch_menu.git`

Features:

Create your batch files folder: By default, it looks for a folder called batch_files in the same directory as the menu script
Place your batch files in that folder (they should have .bat extension)
Auto-discovery: Automatically finds all .bat files in the specified folder
Numbered menu: Shows a numbered list of available batch files
Error handling: Checks for folder existence and validates user input
Folder switching: Option to change the batch files folder location
Refresh capability: Updates the list without restarting
Clean interface: Uses colors and clear formatting

How it works:

Run the menu script and it will display all available batch files
Enter the number corresponding to the batch file you want to run
The selected batch file runs and returns you to the menu when complete
Use the refresh option if you add new batch files
Use the folder option to point to a different batch files directory

Customization:
To change the default folder location, modify this line in the script:
batchset "BATCH_FOLDER=%~dp0batch_files"
Replace batch_files with your preferred folder name or full path.
The menu will handle all the file execution and provide a clean way to organize and run your batch files!
