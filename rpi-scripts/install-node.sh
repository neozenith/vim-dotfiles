#! /bin/bash
export ARCH=`uname -m`
# TODO: Get latest version by curl scraping this URL
# https://nodejs.org/en/download/current/


NODE_DL=`curl -s https://nodejs.org/en/download/current/ | grep -E 'v[0-9][0-9]' | grep "$ARCH"`
NODE_PREFIX=$HOME/opt/node
echo $NODE_DL

# TODO: get sed regex working consistently across platforms
export NODE_VERSION=`curl -s https://nodejs.org/en/download/current/ | grep -E 'v[0-9][0-9]' | grep "$ARCH" | sed -r s/.*\(v[0-9]+\.[0-9]+.[0-9]+\).*/\\1/g | head -1`

# just hardcode latest version
export NODE_VERSION=v11.6.0

export NODE_DIST="node-$NODE_VERSION-linux-$ARCH"
echo $NODE_VERSION
echo $NODE_DIST
cd $HOME

wget "https://nodejs.org/dist/$NODE_VERSION/$NODE_DIST.tar.xz"
if [[ -e "$NODE_DIST.tar.xz" ]]; then
  tar -xvf "$NODE_DIST.tar.xz" 
  cd "$HOME/$NODE_DIST"
  mkdir -pv $NODE_PREFIX 
  [ -n "$(pwd | grep node 2> /dev/null)" ] && cp -Rv * $NODE_PREFIX
fi

which node
node --version
which npm
npm --version

echo "Add the following to your .bashrc"
echo "[[ -z \"\$(echo \$PATH | grep \"$NODE_PREFIX\")\" ]] && export PATH=$NODE_PREFIX:\$PATH"
