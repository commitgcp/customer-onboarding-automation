# Comm-IT GCP Onboarding


## Let's get started!

We're going to go through a few short steps to get you set up and working with the Comm-IT GCP team!

**Time to complete**: About 5-10 minutes

Click the **Start** button to move to the next step.

## Step 0 - Login to GCloud

Let's make sure you're logged in and able to use the gcloud CLI. 

To login, execute the following command:

```bash
gcloud auth login
```

You will be prompted to navigate to an authentication page. Once you sign in there, you will receive a code, which you must paste back into the terminal, at the prompt. Once you're done, you should see a message that looks like: "You are now logged in as [<YOUR_EMAIL_ADDRESS>]"

Click "Next" when you've finished.

## Step 1 - Read Only Permissions on Organization

The first step is to grant read-only permissions to Comm-IT's support team on the customer's organization. We recommend that the client give us permissions as viewers so that our support team can provide a better service, however this is not mandatory. There are clients who prefer not to provide these permissions for compliance or privacy reasons. If you would like to skip this step, click "Next" below without executing the steps in this slide. 

To grant the permissions, execute the following command:

```bash
./1_organization_permissions.sh
```

**Tip**: Click the copy button on the side of the code box and paste the command in the Cloud Shell terminal to run it.

You will be prompted for your Organization ID. To find this, in the GCP Console, in the top toolbar, left of the search bar, click the dropdown menu and go to the "ALL" tab. Your Organization ID should be next to your Organization name.

Click "Next" when you've finished.

## Step 2 - Billing Administrator Permissions

In order to migrate the projects to our sub-billing account we will need Billing Administrator permissions in the customer's projects.

To grant the permissions, execute the following command:

```bash
./2_billing_project_manager.sh <PROJECT_ID_1> <PROJECT_ID_2> <PROJECT_ID_3> ...
```

**Tip**: Click the copy button on the side of the code box and paste the command in the Cloud Shell terminal to run it.

You must provide project IDs as arguments to the script, as shown above. To find a project ID, in the GCP Console, in the top toolbar, left of the search bar, click the dropdown menu and find your project name. Its project ID should be next to its name (these are often the same, but not always). Save these project IDs for the next step!

Click "Next" when you've finished.

## Step 3 - Move Project to Sub-Billing Account

We need to link the customer's projects to the customer's sub-billing account. To link the projects to the billing account, execute the following command:

```bash
./3_link_billing_account.sh <PROJECT_ID_1> <PROJECT_ID_2> <PROJECT_ID_3> ...
```

**Tip**: Click the copy button on the side of the code box and paste the command in the Cloud Shell terminal to run it.

These are the same project IDs you provided in the last step.

You will be prompted for a Billing Account ID. To find this, go to the Billing page: https://console.cloud.google.com/billing and from there, find the desired sub-billing account, and go to "Account Management".

Click "Next" when you've finished.

## Congratulations

<tutorial-conclusion-trophy></tutorial-conclusion-trophy>

You’re all set to work with Comm-IT!

