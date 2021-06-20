FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install -y \
        gnupg \
        gnupg2 \
        software-properties-common \
        openssh-client \
        apt-transport-https \
        vim\
        net-tools \
        curl \
        wget \
        ca-certificates \
        lsb-release

# Add Repositories
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
RUN apt-add-repository ppa:neovim-ppa/unstable
# RUN apt-add-repository ppa:system76/pop
RUN apt-add-repository https://cli.github.com/packages
RUN apt-add-repository ppa:fingerprint/fingerprint-gui
RUN add-apt-repository ppa:aslatter/ppa

# Brave Browser
RUN curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
RUN "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list

# .NET
RUN wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

# Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN chmod +x Miniconda3-latest-Linux-x86_64.sh && ./Miniconda3-latest-Linux-x86_64.sh -bf && rm Miniconda3-latest-Linux-x86_64.sh

# Express VPN
RUN curl https://www.expressvpn.works/clients/linux/expressvpn_3.7.0.29-1_amd64.deb -O
RUN dpkg --install expressvpn_3.7.0.29-1_amd64.deb && rm expressvpn_3.7.0.29-1_amd64.deb

# Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Install Packages
RUN apt update && apt upgrade -y

RUN apt install -y \
        python3 \
        python3-pip \
        git \
        nodejs \
        npm \
        scala \
        ruby \
        ruby-dev \
        cpanminus \
        dotnet-sdk-5.0 \
        default-jre

RUN apt install -y \
        neovim \
        tmux \
        tree \
        htop \
        openssh-client \
        ripgrep \
        fzf \
        jq \
        alacritty \
        gh \
        awscli \
        highlight

RUN apt install -y \
        zsh \
        transmission-cli \
        xclip \
        vlc \
        maim \
        # speedtest-cli \
        # flameshot \
        # codium \
        # Performance boost most used applications
        # preload \
        # Media codecs
        # ubuntu-restricted-extras \
        # gnome-tweaks \
        # brave-browser \
        # fonts-cascadia-code \
        expressvpn

# Docker
# RUN apt install -y \
#         docker-ce \
#         docker-ce-cli \
#         containerd.io

# RUN newgrp docker
# RUN apt autoremove

# Language Packages
RUN npm i -g tldr gitignore.cli neovim
RUN gem install neovim
RUN cpanm -n Neovim::Ext

# Oh My Zsh
RUN curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Starship
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh --yes)"

# Create User and Pass Configuration
RUN apt install sudo -y
ARG USER=${USER:-dotfiles_user}

RUN useradd --create-home $USER
RUN usermod -aG sudo $USER
# RUN gpasswd -a $USER docker
WORKDIR /home/$USER/

COPY --chown=$USER . .config/

RUN chsh -s /usr/bin/zsh $USER

####### Entering User

USER $USER

ENV DOTFILESSYNC_DIR=.config
RUN bash ${DOTFILESSYNC_DIR}/install/links.sh

# NVIM Plugins
RUN curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# RUN nvim --noplugin -c ":PlugInstall"

# Tmux Plugins
RUN mkdir -p ~/.tmux/plugins/tpm
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Python Tools
RUN python3 -m pip install -r ${DOTFILESSYNC_DIR}/install/requirements.txt

# RUN /usr/bin/fc-cache -fv

###################################
# docker build -f dockerfiles/ubuntu/Dockerfile -t dotfiles_test --build-arg USER=goku .
# docker run -it --rm dotfiles_test bash
