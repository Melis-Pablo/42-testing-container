# 42 Testing Container

## 🎯 Project Overview
A standardized Docker environment that replicates the 42 School computing environment for reliable project testing. This container ensures your code works identically in the evaluation environment, helping you avoid unexpected issues during project evaluation.

## 📁 Repository Contents
- `42testing.sh`: Bash script that automates container setup, mounting, and cleanup
- `docker-compose.yml`: Configuration for services, volumes, and networking
- `Dockerfile`: Instructions for building the 42 School-compatible environment

## 🚀 Quick Start

### Prerequisites
- [Docker](https://docs.docker.com/get-docker/) (20.10.0+)
- [Docker Compose](https://docs.docker.com/compose/install/) (2.0.0+)

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Melis-Pablo/42-Testing-Container.git
   cd 42-Testing-Container
   ```

2. **Configure the Script**
   Edit the `42testing.sh` script to point to your local repository:
   ```bash
   CONTAINER_FILES=~/path/to/42-Testing-Container
   ```

3. **Setup Alias (Recommended)**
   Add to your shell configuration file (~/.bashrc or ~/.zshrc):
   ```bash
   alias 42testing='~/path/to/42-Testing-Container/42testing.sh'
   ```

   Then reload your configuration:
   ```bash
   source ~/.bashrc  # or source ~/.zshrc
   ```

### Usage

Navigate to your 42 project directory and run:
```bash
42testing
```

This will:
1. Start the container with your current directory mounted
2. Open a ZSH shell inside the container
3. Automatically clean up when you exit the shell

## ⚙️ How It Works

The `42testing.sh` script performs the following operations:

```bash
# Simplified workflow
PWD=$(pwd)                   # Get current directory
export CURRENTDIR=$PWD       # Export as environment variable
cd $CONTAINER_FILES          # Navigate to container files
docker-compose up -d --build # Start container in background
CONTAINER_ID=$(...)          # Get running container ID
docker exec -it $CONTAINER_ID zsh # Attach to container
docker-compose down          # Clean up when done
```

## 🔧 Customization

### Container Packages
You can modify the `Dockerfile` to add additional packages or configurations:

```dockerfile
# Example: Add additional packages
RUN apt-get update && apt-get install -y \
    valgrind \
    gdb \
    # Add your packages here
```

### Volume Mounting
Adjust the `docker-compose.yml` file to change how volumes are mounted:

```yaml
volumes:
  - ${MOUNT_DIR}:/home/developer  # Mount current directory to /developer
  # Add additional volumes as needed
```

## 🔍 Troubleshooting

### Common Issues

1. **Docker not running**
   ```bash
   sudo systemctl start docker
   ```

2. **Permission denied**
   ```bash
   sudo chmod +x 42testing.sh
   ```

3. **"Cannot connect to the Docker daemon"**
   ```bash
   sudo usermod -aG docker $USER  # Add user to docker group
   # Log out and back in
   ```

## 📝 Notes
- This environment mimics the 42 School setup but may not be 100% identical
- The Dockerfile can be further optimized for size and build speed
- Consider contributing improvements back to this repository

## 📬 Contact & Support
- Open an issue on GitHub for bugs or feature requests
- Pull requests for improvements are welcome
- Contact: [melispablo@gmail.com]

---

*This project is not officially affiliated with 42 School*