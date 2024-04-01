#!/bin/bash

# Check if at least one project ID is provided
if [ $# -eq 0 ]; then
    echo "You need at least one project ID in order to continue."
    echo "Please refer to the tutorial on the right side of the page if you require assistance."
    exit 1
fi

# Prompt the user for a billing account ID
read -p "Please enter your billing account ID: " billing_account_id

# Check if the billing account ID is provided
if [ -z "$billing_account_id" ]; then
    echo "You require a billing account ID in order to continue."
    echo "Please refer to the tutorial on the right side of the page if you require assistance."
    exit 1
fi

# Iterate over each project ID provided as an argument
for project_id in "$@"; do
    echo "Linking project $project_id to billing account $billing_account_id"

    # Use the gcloud CLI to link the project to the provided billing account
    gcloud beta billing projects link $project_id --billing-account=$billing_account_id

    # Check if the command was successful
    if [ $? -eq 0 ]; then
        echo "Project $project_id successfully linked to billing account $billing_account_id"
    else
        echo "Failed to link project $project_id to billing account $billing_account_id"
    fi
done
