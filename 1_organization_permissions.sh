#!/bin/bash

# Prompt the user for their organization ID
read -p "Please enter your organization ID: " org_id

# Check if the organization ID input is blank
if [ -z "$org_id" ]; then
    echo "You need an organization ID in order to continue."
    echo "Please refer to the tutorial on the right side of the page if you require assistance."
else
    # Assign Viewer role to the principal
    gcloud organizations add-iam-policy-binding "$org_id" \
        --member="group:gcp-support@comm-it.cloud" \
        --role="roles/viewer" \
        --condition=None

    # Assign Browser role to the principal
    gcloud organizations add-iam-policy-binding "$org_id" \
        --member="group:gcp-support@comm-it.cloud" \
        --role="roles/browser" \
        --condition=None

    echo "Viewer and Browser IAM roles have been assigned to gcp-support@comm-it.cloud for organization ID $org_id"
fi
