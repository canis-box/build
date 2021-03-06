#!/bin/sh -eux
# run this first as root to disable password checks for the vagrant user when using sudo

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers;

# Set up password-less sudo for the vagrant user
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >/etc/sudoers.d/99_vagrant;

chmod 440 /etc/sudoers.d/99_vagrant;

