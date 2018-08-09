#!/bin/bash

export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
# install npm node
mkdir -p /opt/soft
cd /opt/soft
wget $NVM_NODEJS_ORG_MIRROR/v4.6.1/node-v4.6.1-linux-x64.tar.xz
xz -d node-v4.6.1-linux-x64.tar.xz
tar -xvf node-v4.6.1-linux-x64.tar

echo 'export PATH="/opt/soft/node-v4.6.1-linux-x64/bin:$PATH"' >> /etc/profile
source /etc/profile

npm --registry=http://npm.byted.org/ install pm2 -g

ln -s /opt/soft/node-v4.6.1-linux-x64/bin/node /usr/local/bin/node
ln -s /opt/soft/node-v4.6.1-linux-x64/bin/npm /usr/local/bin/npm
ln -s /opt/soft/node-v4.6.1-linux-x64/lib/node_modules/pm2/bin/pm2 /usr/local/bin/pm2

#install nvm and candinary nodes
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | NVM_DIR=/usr/local/nvm bash

echo 'export NVM_DIR="/usr/local/nvm"' >> /etc/profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> /etc/profile
source /etc/profile

nvm install 6.10.3
nvm install 6.11.2
nvm install 7.9.0
nvm install 7.10.1
nvm install 8.1.4
nvm install 8.2.1
nvm install 8.9.2
nvm install 9.2.0
nvm use system
nvm alias default system
nvm alias stable 8.9.2
