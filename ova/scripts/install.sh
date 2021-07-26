## ENSURE PHOTON IS UPDATED
tdnf update -y

## ENABLE DOCKER
#systemctl enable docker.service && systemctl start docker.service

## UPDATE FIREWALL RULES
iptables -A INPUT -p tcp --dport 6443 -j ACCEPT
iptables -A INPUT -p udp --dport 8472 -j ACCEPT
iptables -A INPUT -p tcp --dport 10250 -j ACCEPT

## INSTALL DEPENDENCIES
#tdnf install tar python3-pip -y
#pip3 install openshift pyyaml kubernetes

## INSTALL DOCKER-COMPOSE
#curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose

## INSTALL K3S
#curl -L https://github.com/k3s-io/k3s/releases/download/v1.20.4%2Bk3s1/k3s > /usr/bin/k3s
#chmod +x /usr/bin/k3s

## INSTALL HELM
#mkdir /helm && cd /helm
#curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
#chmod 700 get_helm.sh
#./get_helm.sh

## PREPARE PHOTON FOR CLONING (RESET MACHINE ID)
echo -n > /etc/machine-id