#!/bin/bash

# Prompt the user for a new project name
echo "Please enter a name for the new project. The project should be named following the convention <companyname-billing>:"
read project_name

# Check if the project name input is blank
if [ -z "$project_name" ]; then
    echo "You need a project name in order to continue."
    echo "Please refer to the tutorial on the right side of the page if you require assistance."
    exit 1
fi

# Prompt the user to choose between assigning the role to a user or a group
echo "Do you want to assign the Owner role to a (U)ser or a (G)roup? [U/G]:"
read assign_type

# Normalize the input to uppercase
assign_type=${assign_type^^}

# Set the member type based on user input
if [ "$assign_type" == "U" ]; then
    member_type="user"
elif [ "$assign_type" == "G" ]; then
    member_type="group"
else
    echo "Invalid selection. Please start over and select either U for User or G for Group."
    exit 1
fi

# Prompt for the email address based on the selection
echo "Enter the email address of the $member_type to assign the Owner role to:"
read email_address

# Check if the email address input is blank
if [ -z "$email_address" ]; then
    echo "You need to provide an email address in order to continue."
    exit 1
fi

# Set the project ID variable (modify this pattern if you need a different project ID structure)
project_id="${project_name// /-}"

# Use the gcloud CLI to create the project
echo "Creating the project: $project_name with ID: $project_id"
gcloud projects create $project_id --name="$project_name"

# Check if the project was created successfully
if [ $? -eq 0 ]; then
    echo "Project $project_name created successfully."

    # Assign the Owner role to the specified email address with the correct member type
    echo "Assigning the Owner role to $email_address for project: $project_id"
    gcloud projects add-iam-policy-binding $project_id \
        --member="$member_type:$email_address" \
        --role="roles/owner"

    # Check if the role assignment was successful
    if [ $? -eq 0 ]; then
        echo "Owner role assigned successfully to $email_address for project: $project_id"
    else
        echo "Failed to assign the Owner role to $email_address for project: $project_id"
    fi
else
    echo "Failed to create project $project_name."
fi
