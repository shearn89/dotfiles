mkdir -p ~/repos ~/source
pushd ~/source
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
git clone https://github.com/seebi/dircolors-solarized
popd

# Install hub
echo "please install hub from https://github.com/github/hub/releases/latest"

cp profile ~/.profile
echo "complete"
