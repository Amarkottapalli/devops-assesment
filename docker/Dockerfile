FROM ubuntu:24.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server sudo python3 iptables iproute2 iputils-ping curl ca-certificates \
 && rm -rf /var/lib/apt/lists/* && mkdir -p /run/sshd && rm -f /etc/ssh/ssh_host_*
RUN useradd -m -s /bin/bash devops \
 && echo "devops ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/devops \
 && chmod 440 /etc/sudoers.d/devops
RUN printf "PasswordAuthentication no\nKbdInteractiveAuthentication no\nPermitRootLogin no\nPubkeyAuthentication yes\nAllowUsers devops ansible_user\n" \
 > /etc/ssh/sshd_config.d/99-hardening.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
