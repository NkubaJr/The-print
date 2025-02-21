After cloning the github repo created using the command 
```bash
cd  submission_reminder_IsimbiNelly
```
From there,a file script was created 
```bash
vi create_directory.sh
```
In the script file, the main directory was created in which four other subdirectories were created for their specific functions
```bash
submission_reminder_IsimbiNelly/
├── app/
│   └── reminder.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── modules/
    └── functions.sh
 ```
config.env → Stores environment variables
submissions.txt → Contains student assignment records
reminder.sh → Handles reminder notifications
functions.sh → Includes helper functions
startup.sh → Starts the application

After , the script file was executed and ran
```bash
chmod +x create_environment.sh
./create_environment.sh
```
After that, the script was pushed to github
```bash
git add .
git commit -m "Summative"
git push
```
