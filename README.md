# 42-Testing-Container

## Project Overview
This project provides a convenient way to set up and manage a Docker container for testing purposes. The provided script automates the process of starting the container, attaching to it, and cleaning up afterward.

## Files
- `42testing.sh`: Bash script to run the Docker container in the current directory and attach to it.
- `docker-compose.yml`: Docker Compose configuration file.
- `Dockerfile`: Dockerfile for building the Docker image.

## Setup Instructions

### Prerequisites
- Docker
- Docker Compose

### Step-by-Step Guide

1. **Clone the Repository**
    ```sh
    git clone <repository_url>
    cd <repository_name>
    ```

2. **Modify the Script**
    Edit the `42testing.sh` script to reflect the path where you cloned this repository:
    ```sh
    CONTAINER_FILES=~/path/to/your/cloned/repo
    ```

3. **Create an Alias**
    To simplify the process of running the script, create an alias in your shell configuration file (e.g., `.bashrc` or `.zshrc`):
    ```sh
    alias 42testing='~/path/to/your/cloned/repo/42testing.sh'
    ```
    After adding the alias, reload your shell configuration:
    ```sh
    source ~/.bashrc  # or source ~/.zshrc
    ```

4. **Run the Container**
    You can now run the container in the current directory volume with the alias:
    ```sh
    42testing
    ```

## Script Details

The `42testing.sh` script performs the following actions:
1. Gets the current directory to mount.
2. Exports the current directory as an environmental variable.
3. Sets the path to the Docker Compose directory.
4. Navigates to the Docker Compose directory.
5. Starts Docker Compose in detached mode and builds the containers.
6. Gets the container ID of the running service.
7. Attaches to the container's terminal using `zsh`.
8. Stops and removes the container once the `zsh` session ends.

## Additional Notes
- Ensure that Docker and Docker Compose are properly installed and running on your system.
- Customize the Docker Compose and Dockerfile configurations as needed for your specific use case.

## Contact
For any issues or questions, please open an issue on the project repository or contact the maintainer.

---

By following these instructions, you should be able to set up and use the Docker container environment efficiently for your testing purposes.
