curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --tls
VNODEJS=$(node --version)
sudo cp -r $HOME/.nvm/versions/node/$VNODEJS/usr/local/nodejs
sudo ln -sf /usr/local/nodejs/bin/node /usr/local/bin/node
sudo ln -sf /usr/local/nodejs/bin/npm /usr/local/bin/npm
sudo ln -sf /usr/local/nodejs/bin/npx /usr/local/bin/npx
python3 -m pip install --upgrade pip
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
