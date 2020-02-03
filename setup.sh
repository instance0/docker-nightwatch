#!/bin/sh

set -eux

curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

apt-get -y update
apt-get -y install libnss3-dev unzip xvfb libxi6 libgconf-2-4
apt-get -y install default-jdk
apt-get -y install google-chrome-stable


VERSION=$(curl https://chromedriver.storage.googleapis.com/LATEST_RELEASE_73)
wget https://chromedriver.storage.googleapis.com/${VERSION}/chromedriver_linux64.zip
unzip chromedriver_linux64.zip

mv chromedriver /usr/bin/chromedriver
chmod +x /usr/bin/chromedriver

wget https://selenium-release.storage.googleapis.com/3.13/selenium-server-standalone-3.13.0.jar
wget http://www.java2s.com/Code/JarDownload/testng/testng-6.8.7.jar.zip
unzip testng-6.8.7.jar.zip

npm config set scripts-prepend-node-path true
