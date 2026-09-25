#!/bin/bash
ssh-keygen -A
mkdir -p /home/devops/.ssh
cp /tmp/pubkey /home/devops/.ssh/authorized_keys
chown -R devops:devops /home/devops/.ssh
chmod 700 /home/devops/.ssh
chmod 600 /home/devops/.ssh/authorized_keys
[ -x /usr/local/bin/firewall.sh ] && /usr/local/bin/firewall.sh
[ -x /usr/sbin/nginx ] && nginx
exec /usr/sbin/sshd -D -e
