#!/bin/bash
#instalujemy dockera
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
#echo "iwona-tutaj"
# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
echo "install docker the latest version"
#install docker the latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "dodajemy  naszego usera do dockera bez roota"
#dodajemy naszego usera do grupy userow docker aby nie uzywac sudo
#sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "jestem po dodaniu usera dockeroweg"
echo "instalujemy kubeclt"
#Potem instalujemy kubectl:
curl -LO https://dl.k8s.io/release/v1.28.3/bin/linux/amd64/kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

echo "teraz instalacja minikube"
#Instaluję minikube ( z tej strony to biorę: https://phoenixnap.com/kb/install-minikube-on-ubuntu)

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install curl
sudo apt-get install apt-transport-https

#Sciągam najnowszą binarkę minikube:
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod 755 /usr/local/bin/minikube
minikube version
# teraz mzemy ruszyc z minikube
#minikube start  - tutaj mamy dokcer do wirtualizacji a  nie virsha.
