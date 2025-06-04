# STEPS
0. Grant READ token to github repo
1. createaws-team/  secret in secret manger (AccessToken & url)
2. cd deployment and run ./init.sh
3. wait for output similar to this : 
    $ 123456789101 configured as delegated Admin for AWS Account Manager
    $ 123456789101 configured as delegated Admin for cloudtrail
    $ 123456789101 configured as delegated Admin for IAM Identity Center
4. cd deployment and run ./deploy.sh
5. Once the deployment script has completed execution and the cloudformation stack has been created successfully, go to the AWS Amplify console to monitor the status of the TEAM application deployment. It takes about 20 mins to complete the build and deployment of the Amplify application stack.
6. cd deployment and run ./integration.sh this will prodeuce results similar to this: 

applicationStartURL: https://d1s8z5724fsfj7-main.auth.amazoncognito.com/authorize?client_id=2vf6faj4v3t1jdos0misu29i67&response_type=code&scope=aws.cognito.signin.user.admin+email+openid+phone+profile&redirect_uri=https://main.d1s8z5724fsfj7-.amplifyapp.com/&idp_identifier=team
applicationACSURL: https://d1s8z5724fsfj7-main.auth.amazoncognito.com/saml2/idpresponse
applicationSAMLAudience: urn:amazon:cognito:sp:us-east-1_GXaUCfcno


6.a Configure IAM Identity Center SAML Integration

In AWS IAM Identity Center console > Application assignment > Applications > Add application

Select Add custom SAML 2.0 Application and click on Next
Type TEAM IDC APP as display name and add a description for the TEAM application under Configure application section.
Copy and save the URL of AWS IAM Identity Center SAML metadata file URL. It would be used later for configuring Cognito User pool.
Enter the value of applicationStartURL parameter in Application start URL under the Application properties section:

In the Application Metadata section select Manually type your metadata values.
Enter the value of applicationACSURL parameter in Application ACS URL.
Enter the value of applicationSAMLAudience parameter in Application SAML audience.

Click Submit to save configuration.

7. Configure Attribute Mapping
    a. Click Actions dropdown and edit attribute mappings with the following

    Subject - ${user:subject} - persistent
    Email - ${user:email} - basic
    Click SAVE changed

8. Assign Groups to TEAM app, Under Assigned Users Click the Assign users and add users. This will grant assigned users and groups access to login to the TEAM application.

9. Update details.json with the value from metadata file url. 

{
    "MetadataURL": "https://portal.sso.us-east-1.amazonaws.com/saml/metadata/ODQzNTUxMTgwNTcyX2lucy04NGM3MThiMzkyY2Y2YTM1"
}

Run Cognito configuration script
The cognito.sh bash script in the deployment folder performs the following actions within the TEAM_ACCOUNT:

Configures AWS IAM Identity Center as a SAML provider for the TEAM Cognito user pool
Updates the TEAM application client configuration to make use of the configured AWS IAM Identity Center SAML provider

10. cd deployment ./cognito.sh

11. The TEAM administrators can now configure your organization-specific policies and settings for requesting and granting elevated access.






# Temporary elevated access management (TEAM) for AWS IAM Identity Center
This repository contains the source code for deploying TEAM application.

TEAM is an open source solution that integrates with AWS IAM Identity Center and allows you to manage and monitor, time-bound elevated access to your multi-account AWS environment at scale.

The solution is a custom application that allows users to **request access to an AWS account** only when it is needed and only **for a specific period of time**. Once the time period has elapsed, elevated access is automatically removed.

Refer to the [blog post on the AWS Security Blog](https://aws.amazon.com/blogs/security/temporary-elevated-access-management-with-iam-identity-center/) for a background and an overview of the TEAM solution.

![](docs/docs/assets/images/home_page.png)
## Getting Started
Visit our **[Documentation pages](https://aws-samples.github.io/iam-identity-center-team/)** to learn more and get started installing and using TEAM.

### Quick links
- [Deploying the TEAM application](https://aws-samples.github.io/iam-identity-center-team/docs/deployment/)
- [Solution architecture and workflows](https://aws-samples.github.io/iam-identity-center-team/docs/overview/)
- [User guides and walkthrough](https://aws-samples.github.io/iam-identity-center-team/docs/guides/)
- [Blog Post](https://aws.amazon.com/blogs/security/temporary-elevated-access-management-with-iam-identity-center/)
- [ReInforce talk](https://www.youtube.com/watch?v=a1Na2G7TTQ0)
- [Feedback form](https://www.pulse.aws/survey/PZDTVK85)

## Feedback 

We value your input! Please take a moment to provide us with your [feedback](https://www.pulse.aws/survey/PZDTVK85). 

Thank you for helping us improve!
## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.