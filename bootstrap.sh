#! /usr/bin/env bash

# Update system

apt-get update -y

# Create a swap file

fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# RVM

echo "Installing RVM..."

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
sudo usermod -a -G rvm vagrant

# Ruby

echo "Installing Ruby 2.4..."

rvm install 2.4

# NodeJS

echo "Installing Node..."

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y build-essential

# Yarn

echo "Installing Yarn..."

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update -y && apt-get install yarn -y

# Install postgres

echo "Installing Postgres..."

apt-get install postgresql postgresql-contrib libpq-dev -y

echo "Creating user vagrant for Postgres..."

sudo -u postgres bash -c "psql -c \"CREATE ROLE vagrant LOGIN PASSWORD '';\""
sudo -u postgres bash -c "psql -c \"ALTER ROLE vagrant CREATEDB CREATEROLE;\""
sudo -u vagrant createdb

# Install some gems

gem install rails html2slim
