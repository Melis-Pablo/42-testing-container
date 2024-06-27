# Debian Base Image
FROM ubuntu:latest

# Standard Linux Packages
RUN apt-get update --no-install-recommends -y
RUN apt-get install --no-install-recommends \
    # Standard Build Environment
    'gcc' \
    'man-db' \
    'less' \
    'build-essential' \
    'libtool-bin' \
    'valgrind' \
    'gdb' \
    'automake' \
    'make' \
    'ca-certificates' \
    'g++' \
    'libtool' \
    'pkg-config' \
    'manpages-dev' \
    'zip' \
    'unzip' \
    'python3' \
    'python3-pip' \
    'git' \
    'openssh-server' \
    'dialog' \
    'llvm' \
    'clang' \
    'curl' \
    'wget' \
    'zsh' \
    'nano' \
    'vim' \
    'moreutils' \
    # Push Swap Projects
    'python3-tk' \
    'ruby' \
    'bc' \
    'htop' \
    # Minishell Projects
    'libreadline-dev' \
    # Minilibx Projects
    'libbsd-dev' \
    'libxext-dev' \
    'libx11-dev' \
    # IRC Project Test Example
    # 'irssi' \
    # 'netcat' \
    # 'tcpdump' \
    # 'net-tools' \
    # neovim requirements
    'ripgrep' \
    'xclip' \
    'clangd' \
    'liblua5.1-0-dev' \
    'neovim' \
    #"wireshark" \
    -y \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# minilibx-linux source and install
RUN git clone https://github.com/42Paris/minilibx-linux.git /usr/local/minilibx-linux
RUN cd /usr/local/minilibx-linux/ && ./configure \
    && cp /usr/local/minilibx-linux/*.a /usr/local/lib \
    && cp /usr/local/minilibx-linux/*.h /usr/local/include \
    && cp -R /usr/local/minilibx-linux/man/* /usr/local/man/ \
    && /sbin/ldconfig

# norminette 
RUN apt install pipx -y
RUN pipx install norminette
ENV PATH="/root/.local/bin:${PATH}"

# OhMyZsh Install, set prompt to DEVCONTAINER
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"  \ && echo 'PROMPT=%B%F{blue}[DEVCONTAINER]%f%b$PROMPT' >> /root/.zshrc

# Create Folders
RUN mkdir -p /home/developer /root/.ssh

# SSH Keys
COPY ./.ssh /root/.ssh

# set working directory to /home/vscode/src
WORKDIR  /home/developer
