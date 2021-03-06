#!/bin/bash
# setup.sh:
# installation script for material-decoration-bt
# must be run from source's main folder
set +e

mkdir build 2>/dev/null
cd build
set -e
echo 'Preparing build environment...'
cmake -DCMAKE_INSTALL_PREFIX=/usr .. > setup.log ||  echo 'Something went wrong while preparing the source. Check setup.log for more information.'

echo 'Installing requires root privileges.'
echo 'bt-opacity will be installed in /opt/material-decoration-bt'
sudo make -j4 install >> setup.log && echo 'Done building (1/2)' || echo 'Something went wrong while building. Check setup.log for more information.'

set +e
cd ..
sudo mkdir /opt 2>/dev/null
sudo cp -r $(pwd) /opt/
sudo chmod +x /opt/material-decoration-bt/bt-opacity.sh
sudo chmod +x /opt/material-decoration-bt/chwm.sh
sudo ln -s /opt/material-decoration-bt/bt-opacity.sh /usr/bin/bt-opacity
sudo rm /opt/material-decoration-bt/setup.sh
sudo rm -rf /opt/material-decoration-bt/build/*
echo 'Run bt-opacity anywhere to change theme transparency at runtime.'
echo 'Done copying and setting up (2/2)'
 
