# SecureCodeQA
# 
∨工匚匕口尺 Ｊ∪ㄥ工口 爪丹匚工丹ち
# Installation Docker


# Installation gitlab-ce Ubuntu 18 
sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="192.168.0.x/gitlab" apt-get install gitlab-ce

# Installation gitlab-ce Ubuntu 20

sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="192.168.0.x/gitlab" apt-get install gitlab-ce
