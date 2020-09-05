
# Go to the home directory
cd ~

# Install java and graphviz (plantUML and many more other apps need it)
sudo apt-get install -y graphviz
sudo apt install default-jre

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


# Install Zsh + Oh My Zsh + Powerline fonts 
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
sudo apt-get install fonts-powerline # That's it.

#Font support for the integrated terminal of the vscode:
#1. Go to the GitHub repo: https://github.com/abertsch/Menlo-for-Powerline/blob/master/Menlo%20for%20Powerline.ttf
#2. Download the  Powerline.ttf
#3. Install the font by double clicking on it or install manually: cp "Menlo for Powerline.ttf" ~/.fonts
#4. Update the cache font: fc-cache -vf ~/.fonts
#5. Add the followind line to the settings.json inside .vscode
# {"terminal.integrated.fontFamily": "Menlo for Powerline"}
# At this point the font problem in the integrated terminal of the vscode should dissappear.

# Now, let's do the vim set up
sudo apt-get install vim  

# Install vim bundle for plug-in management
mkdir -p ~/.vim/bundle 
cd ~/.vim/bundle/ 
git clone https://github.com/sjl/badwolf.git 
echo "set runtimepath^=~/.vim/bundle/badwolf" > ~/.vimrc

# Finally customize the .vimrc with following contents
echo "set runtimepath^=~/.vim/bundle/badwolf" >> ~/.vimrc
echo "set number" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "set guifont=Menlo\ for\ Powerline" >> ~/.vimrc

# Install gig gui 
sudo apt-get install git-gui

# Install gitk
sudo apt-get install -y gitk

# Create the alias for git gui and gitk as gitg
# git gui & gitk &

# Then create the alias for gitk and git-gui both as a gitg 
# Since we are using the zshell so writing on basrc won't work
echo "alias gitg='git gui & gitk &'" >> ~/.zshrc

# Add some alias for the git commands
git config --global alias.st status 
git config --global alias.co checkout

# Update the git identity with email and username
git config --global user.email "baalkissna2012@gmail.com"
git config --global user.name "Bal K. Poudel"

# vscode cross compilation set up 
## # Remote file editing ###
# 1. Dracula official theme
# 2. Remote VSCode for editing the files in RPi from visual studio code
# 3. Install the rmate from this github page: https://github.com/aurora/rmate
# 4. Eclipse keymap (for navigatin CTRL+Left and CTRL+Right ...etc)
