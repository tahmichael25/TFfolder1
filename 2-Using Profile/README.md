# Profiles in AWS

## What is a profile?

In AWS (Amazon Web Services), profiles are configurations that allow you to store and manage multiple sets of AWS security credentials. These security credentials typically consist of an access key and a secret access key, which are used to authenticate and authorize access to AWS resources.

## Why use profiles

Profiles are particularly useful when you work with multiple AWS accounts or need to assume different roles within an account. They allow you to switch between different sets of credentials easily, avoiding the need to manually specify the access key and secret access key each time you interact with AWS services.

## Managing profiles using AWS CLI

### Creating a profile
Create a profile named "myprofile" community.

```sh
    aws configure --profile myprofile
```
---
This command will prompt you to enter your AWS Access Key ID, AWS Secret Access Key, default region, and default output format. Once you provide these values, the profile will be created.

### View existing Profiles
List all profiles in the AWS CLI configuration file.

```sh
    aws configure list-profiles
```
---
This command displays a list of all profiles available on your system.

## Managing profiles using Configuration file

### Creating a profile
To create a profile, you can follow these steps:
- Open the AWS Command Line Interface (CLI) configuration file. The default location of this file depends on your operating system:
- - Linux, macOS, or Unix: `~/.aws/config`
- - Windows: `\Users\USERNAME\.aws\config`

- Add a new profile or modify an existing profile within the configuration file. Each profile is denoted by a name in square brackets ([]). For example, to create a profile named "myprofile," you would add the following lines to the configuration file:

```sh
    [profile myprofile]
region = us-west-2
output = json
```
---

In this example, the profile name is "myprofile." The region parameter specifies the default region to use for services, and the output parameter determines the output format for AWS CLI commands (in this case, JSON).

- Save the configuration file.
- Open the AWS credentials file. The default location of this file is as follows
- - Linux, macOS, or Unix: `~/.aws/credentials`
- - Windows: `\Users\USERNAME\.aws\credentials`

- Add the access key and secret access key for your profile within the credentials file. For example:

```sh
    [myprofile]
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
```
---
Replace YOUR_ACCESS_KEY and YOUR_SECRET_ACCESS_KEY with the appropriate values for your profile.

- Save the credentials file.

-  To test access, list contents in an s3 bucket with the above profiles using 
 `aws s3 ls --profile myprofile`


### View existing Profiles

- List all profiles in the AWS CLI configuration file
 `cat ~/.aws/config | grep "\[profile"`

This command lists all profiles configured in the AWS CLI configuration file (~/.aws/config)

- List all profiles in the AWS credentials file
`cat ~/.aws/credentials | grep "\["`

This command lists all profiles in the AWS credentials file (~/.aws/credentials).
