
#!/bin/bash

#This script will install Jarvis onto the CHIP with a choice for either pocketsphinx or snowboy for hotword detection

echo "Preparing for Installation"
echo "Installing dependencies from apt..."

fi
sudo apt-get update
sudo apt-get install python-pyaudio python3-pyaudio sox git python-pip python-dev build-essential make automake gcc g++ bison byacc -y
sudo apt-get install libatlas-base-dev -y

echo "setting up pip..."
sudo pip install --upgrade pip

echo "Cloning dependencies from github and downloading files..."

fi
cd ..
git clone https://github.com/alexylem/jarvis.git
git clone https://github.com/Kitt-AI/snowboy.git
wget https://s3-us-west-2.amazonaws.com/snowboy/snowboy-releases/rpi-arm-raspbian-8.0-1.1.0.tar.bz2

fi

echo "Installing Swig from source"
#Installing the best version of swig
if [ ! -e swig-3.0.7.tar.gz ]; then
  wget -T 10 -t 3 \
    http://prdownloads.sourceforge.net/swig/swig-3.0.7.tar.gz || exit 1;
fi

tar -xovzf swig-3.0.7.tar.gz || exit 1
ln -s swig-3.0.7 swig

cd swig

# We first have to install PCRE.
if [ ! -e pcre-8.37.tar.gz ]; then
  wget -T 10 -t 3 \
    https://sourceforge.net/projects/pcre/files/pcre/8.37/pcre-8.37.tar.gz || exit 1;
fi
Tools/pcre-build.sh

./configure --with-pic
make
sudo make install

cd ..

fi
tar xvjf rpi-arm-raspbian-8.0-1.1.0.tar.bz2
rm -rf rpi-arm-raspbian-8.0-1.1.0.tar.bz2
