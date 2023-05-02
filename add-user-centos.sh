#!/usr/bin/env bash

user="adam"
key_url="https://github.com/adamyordan.keys"

# add user
adduser "" "${user}"

# add user as sudoer
usermod -aG wheel "${user}"
echo "${user} ALL=(root) NOPASSWD: ALL" | tee /etc/sudoers.d/sec

# add public key
mkdir /home/"${user}"/.ssh
wget ${key_url} -O /home/"${user}"/.ssh/authorized_keys
chmod 700 /home/"${user}"/.ssh
chmod 600 /home/"${user}"/.ssh/authorized_keys
chown -R "${user}":"${user}" /home/"${user}"/.ssh
