#!/bin/bash

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    echo "You need at least one project ID in order to continue."
    echo "Please refer to the tutorial on the right side of the page if you require assistance."
    exit 1
fi

# Iterate over each argument provided
for project_id in "$@"; do
    echo "Assigning Project Billing Manager role to gcp-billing-admins@comm-it.cloud for project: $project_id"
    
    # Use the gcloud CLI to add the Project Billing Manager role to the group for the current project ID
    gcloud projects add-iam-policy-binding $project_id \
        --member="group:gcp-billing-admins@comm-it.cloud" \
        --role="roles/billing.projectManager" \
        --condition=None
    
    # Check if the command was successful
    if [ $? -eq 0 ]; then
        echo "Role assigned successfully for project: $project_id"
    else
        echo "Failed to assign role for project: $project_id"
    fi
done
