#!/bin/bash -xe

# vagrant or ubuntu (I'll run this on EC2 as well).
export SETUP_USER=`ls /home`

sudo apt-get update
sudo apt-get install -y net-tools

### Microk8s ###

# Install
sudo snap install microk8s --classic --channel=1.21/stable

microk8s.status --wait-ready

microk8s.enable \
  dns \
  helm3 \
  ingress \
  registry \
  storage

mkdir -p /home/$SETUP_USER/.kube
microk8s config > /home/$SETUP_USER/.kube/config

usermod -a -G microk8s $SETUP_USER
chown -f -R $SETUP_USER /home/$SETUP_USER/.kube

### DOCKER ###

# install
curl https://get.docker.com | sh -

# support microk8s registry
echo '{ "insecure-registries" : ["localhost:32000"] }' > /etc/docker/daemon.json
systemctl restart docker

usermod -aG docker $SETUP_USER

### alias ###

echo "alias k='microk8s kubectl'" >> /home/$SETUP_USER/.bash_aliases
echo "alias kubectl='microk8s kubectl'" >> /home/$SETUP_USER/.bash_aliases
echo "alias helm='microk8s helm3'" >> /home/$SETUP_USER/.bash_aliases
chown $SETUP_USER:$SETUP_USER /home/$SETUP_USER/.bash_aliases