FROM debian
# Debian GNU/Linux 10
# For Ansible v2, from https://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-apt-debian


RUN apt-get update && apt-get install -my wget gnupg

RUN	echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

# Warning: apt-key output should not be parsed (stdout is not a terminal)
# gpg: key 93C4A3FD7BB9C367: public key "Launchpad PPA for Ansible, Inc." imported
# gpg: Total number processed: 1
# gpg:               imported: 1

RUN apt -y upgrade && apt-get update && apt-get install -y \
	git \
	python3-pip \
	build-essential libssl-dev libffi-dev python3-dev \
	python-pip \
	python3-venv python3-pip \	
	openssh-client \
	python-dev \
	python-pycurl \
	ruby \
	curl \
	ansible

# debconf: delaying package configuration, since apt-utils is not installed

ENV	HOME /root
RUN	ssh-keygen -f /root/.ssh/id_rsa -q -N "" \
	&& pip3 install markupsafe dopy boto linode-python pyrax linode-api4

WORKDIR	/root

# update: 02/06/2019 | repo url changed
RUN	git clone https://github.com/StreisandEffect/streisand.git

WORKDIR	/root/streisand

#CMD	["./streisand"]