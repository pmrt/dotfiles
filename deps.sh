sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common


# Nodejs
curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh -o install_nvm.sh
bash install_nvm.sh

# zsh

sudo apt-get install zsh
chsh -s /bin/zsh 
# zsh theme
npm install -g typewritten
# zinit (zsh plugin manager)
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# install then https://github.com/joshskidmore/zsh-fzf-history-search

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Prettier
npm install -g prettier
npm install -g @fsouza/prettierd

# eslint
npm install -g eslint
npm install -g eslint_d

# Telescope
# Ripgrep
sudo apt install ripgrep
# fd
sudo apt-get install fd-find

# Mosh
sudo apt install mosh

# universal ctags
sudo apt install universal-ctags

# python virtual env, required for coq-nvim
sudo apt install --yes -- python3-venv

# docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker $USER
su - ${USER}
id -nG
# docker-compose
#mkdir -p ~/.docker/cli-plugins/
#curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose-linux-x86_64
#chmod +x ~/.docker/cli-plugins/docker-compose

# alt version
# curl -fsSL https://get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# sudo usermod -aG docker $USER
# su - ${USER}
# id -nG

# golang
# gopls y debugger
wget https://golang.org/dl/go1.17.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# lazygit 
go install github.com/jesseduffield/lazygit@latest

# clipboard tool
sudo apt install xclip xsel
