sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common


# Nodejs
curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh -o install_nvm.sh
bash install_nvm.sh

# Prettier
npm install -g prettier

# eslint
npm install -g eslint

# Telescope
# Ripgrep
sudo apt install ripgrep
# fd
sudo apt-get install fd-find

# Mosh
sudo apt install mosh

# docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG


# golang
# gopls y debugger
wget https://golang.org/dl/go1.17.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# lazygit 
go install github.com/jesseduffield/lazygit@latest

# clipboard tool
sudo apt install xclip xsel
