# Batch Menu System

A user-friendly interface to run batch files from a folder with an intuitive menu system.

![Menu Interface](https://github.com/user-attachments/assets/24dc715e-73ec-4401-b4a5-62dc0003ae09)

## Installation

Clone the repository:
```bash
git clone https://github.com/marduk191/batch_menu.git
```

## Setup Instructions

1. **Create your batch files folder**: By default, the system looks for a folder called `batch_files` in the same directory as the menu script
2. **Place your batch files**: Add your batch files with `.bat` extension to the folder

## Features

- **Auto-discovery**: Automatically finds all `.bat` files in the specified folder
- **Numbered menu**: Shows a numbered list of available batch files
- **Error handling**: Checks for folder existence and validates user input
- **Folder switching**: Option to change the batch files folder location
- **Refresh capability**: Updates the list without restarting
- **Clean interface**: Uses colors and clear formatting

## How It Works

1. Run the menu script and it will display all available batch files
2. Enter the number corresponding to the batch file you want to run
3. The selected batch file runs and returns you to the menu when complete
4. Use the refresh option if you add new batch files
5. Use the folder option to point to a different batch files directory

## Customization

To change the default folder location, modify this line in the script:

```batch
set "BATCH_FOLDER=%~dp0batch_files"
```

Replace `batch_files` with your preferred folder name or full path.

---

The menu will handle all the file execution and provide a clean way to organize and run your batch files!
