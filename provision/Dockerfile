FROM ubuntu:16.04

RUN apt-get update \
	&& apt-get -y install openssh-server sudo net-tools python acl \
	&& groupadd ubuntu \
	&& useradd -m -g ubuntu ubuntu \
	&& usermod -a -G sudo ubuntu \
	&& echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
	&& mkdir /var/run/sshd \
	&& chmod 0755 /var/run/sshd

COPY bfg-test.pub /home/ubuntu/.ssh/authorized_keys

RUN chown -R ubuntu.ubuntu /home/ubuntu/.ssh \
	&& chmod 700 /home/ubuntu/.ssh \
	&& chmod 600 /home/ubuntu/.ssh/*

EXPOSE 22 80

CMD ["/usr/sbin/sshd", "-D"]
