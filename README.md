# SecureCodeQA
# 
∨工匚匕口尺 Ｊ∪ㄥ工口 爪丹匚工丹ち
# Installation Docker


# Installation gitlab-ce Ubuntu 18 
sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://192.168.0.x/gitlab" apt-get install gitlab-ce

# Installation gitlab-ce Ubuntu 20

sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix

sudo tee /etc/apt/sources.list.d/gitlab_gitlab-ce.list<<EOF 
deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ bionic main
deb-src https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ bionic main
EOF

sudo apt update

sudo EXTERNAL_URL="http://192.168.0.X/gitlab" apt-get install gitlab-ce