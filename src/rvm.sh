#!/bin/sh -eux
# install rvm

## typical  install
# \curl -sSL https://get.rvm.io | bash -s stable
# usermod -a -G rvm vagrant

apt-get install -y software-properties-common gnupg2
# curl -sSL https://rvm.io/mpapis.asc | gpg --import -
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
chown -R vagrant.vagrant /home/vagrant
apt-add-repository -y ppa:rael-gc/rvm
apt-get -y update
apt-get install -y rvm

