#!/bin/bash

#Prompt user for their name
echo -n "Enter your name: "
read USER_NAME

# Define the main directory name
dir_main="submission_reminder_${USER_NAME}"

# Create the main application directory
mkdir -p "$dir_main"

# Create necessary subdirectories
mkdir -p "$dir_main/modules"
mkdir -p "$dir_main/config"
mkdir -p "$dir_main/assets"
mkdir -p "$dir_main/app"

#Create the needed files 
touch "$dir_main/modules/functions.sh"
touch "$dir_main/config/config.env"
touch "$dir_main/assets/submissions.txt"
touch "$dir_main/app/reminder.sh"
touch "$dir_main/startup.sh"

#functions.sh 
cat << 'EOF' > "$dir_main/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
 
 function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# config.env
cat << EOF > "$dir_main/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# functions.sh
cat << 'EOF' > "$dir_main/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
 
 function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# reminder.sh 
cat << 'EOF' > "$dir_main/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# startup.sh 
cat << 'EOF' > "$dir_main/startup.sh"
#!/bin/bash
echo 'Starting submission reminder app...'
bash "../submission_reminder_NkubaJr/app/reminder.sh"
EOF

# submissions.txt
cat << 'EOF' > "$dir_main/assets/submissions.txt"
#!/bin/bash
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
EOF

# script execution
chmod +x "$dir_main/modules/functions.sh"
chmod +x "$dir_main/startup.sh"
chmod +x "$dir_main/app/reminder.sh" 
