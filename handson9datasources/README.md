Terraform Data Sources
Data sources in Terraform are used to retrieve existing resources or information from external systems. They allow you to dynamically reference existing infrastructure or data without having to manually specify their configuration. This is particularly useful for building reusable modules or automating workflows that interact with existing resources.

Common use-cases of Data Sources
Fetching existing resource details: Retrieving information about existing resources like AWS EC2 instances, GCP Compute Engine instances, or Azure Virtual Machines.
Accessing external data: Importing data from external sources like CSV files, JSON files, or APIs.
Interacting with other Terraform modules: Passing data between modules to create dependencies or share information.