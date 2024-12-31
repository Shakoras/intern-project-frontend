# Project Name
Internship application frontend 
## Overview

This project is a Spring Boot and Angular application that utilizes Docker for deployment. This README explains the environment variables used in the Jenkins pipeline and their purposes for the frontend.

## Environment Variables

The following environment variables are defined for use in the Jenkins pipeline:


### Docker Compose Variables

- **`dbuild`**
    - **Description**: Command to build Docker images using Docker Compose.
    - **Example**: `"docker-compose build"`

- **`dup`**
    - **Description**: Command to start the Docker containers in detached mode.
    - **Example**: `"docker-compose up"`

- **`dup_d`**
    - **Description**: Command to start the Docker containers in detached mode.
    - **Example**: `"docker-compose up -d"`

- **`ddown`**
    - **Description**: Command to stop and remove the Docker containers.
    - **Example**: `"docker-compose down"` (optional, if used)
      

## Notes


**Docker Compose**: The dup_d variable starts containers in detached mode, freeing up the terminal for other tasks.

**Terraform**: Ensure Terraform is installed and configured to manage Azure resources.

**Kubernetes**: Verify kubectl is configured to interact with the AKS cluster.

## Usage

To run the Jenkins pipeline, ensure the environment variables are correctly set in the Jenkins job configuration. Each variable plays a role in the build and deployment process:

1. **Checkout**: The code is pulled from the specified Git repository.
2. **Install Dependencies**: ng compiles the project.
3. **Run Tests**: ng runs the unit tests.
4. **Build Application**: Angular CLI compiles the application into a production-ready build.
5. **Building Docker Images**: Docker images are built using the specified `dbuild` command.
6. **Provision Resources with Terraform**: Uses Terraform to set up resources in Azure.
7. **Deploy to Ubuntu VM**: The Docker containers are started using the `dup_d` command in detached mode (`-d` option starts the containers in the background, allowing your terminal to be free for other tasks).
8. **Deploy to Microsoft Azure**: Deploys the application to Azure Kubernetes Service (AKS).



## Conclusion

This README provides an overview of the environment variables used in this project. For any questions or issues, please reach out to the project maintainers.
