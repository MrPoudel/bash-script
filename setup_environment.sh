
# Go to the home directory
cd 

# Terminator
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update   
sudo apt-get install terminator
#sudo apt-get remove --auto-remove terminator

# Basic tools ( it will install both python 2.7 and python 3)
sudo apt-get install git build-essential gcc pkg-config cmake python 

# For the ccmake graphical interface
sudo apt-get install cmake-curses-gui 

# For encryption support
#sudo apt-get install libmbedtls-dev 

# For unit tests
sudo apt-get install check libsubunit-dev 

# For documentation generation
sudo apt-get install python3-sphinx graphviz 

# Documentation style
sudo apt-get install python-sphinx-rtd-theme 

# pip3
sudo apt-get install python3-pip
# Sphinx theme
pip3 install sphinx_rtd_theme

# Install Gcovr for C/C++ code coverage
sudo apt-get update -y
sudo apt-get install -y gcovr

# For SDL based projects install SDL library
sudo apt-get install libsdl2-dev

# Install Sublime Text 3: install the key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# Add the apt repository
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# Check updates and install
sudo apt-get update
sudo apt-get install sublime-text # Terminal command: subl

# Install cURL
sudo apt install curl


# Install Zsh + Oh My Zsh + Powerline fonts .... [PowerLevel10K]
sudo apt install zsh
# Verify installation
zsh --version
# Make it default
chsh -s $(which zsh)
# Check it if it's default shell now or not
echo $SHELL  # Should be: /usr/bin/zsh  # A logout may be necessary this effect to take place

#Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Do the following manually:
# 1. Open the .zshrc: subl ~/.zshrc
# 2. Change ZSH_THEME="robbyrussell" to ZSH_THEME="agnoster"
# 3. This theme change many not work properly unless you install the right fonts
# So, install powerline-fonts
sudo apt-get install fonts-powerline # That's it


# Now, let's do the vim set up
sudo apt-get install vim  

# Install vim bundle for plug-in management
mkdir -p ~/.vim/bundle 
cd ~/.vim/bundle/ 
git clone https://github.com/sjl/badwolf.git 
echo "set runtimepath^ = ~/.vim/bundle/badwolf" > ~/.vimrc

# Finally customize the .vimrc file ... 