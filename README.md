# SecureCodeQA
# 
∨工匚匕口尺 Ｊ∪ㄥ工口 爪丹匚工丹ち
# Installation Docker


# Installation gitlab-ce Ubuntu 18 
sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://192.168.0.3" apt-get install gitlab-ce
fuente
https://packages.gitlab.com/gitlab/gitlab-ce/install
https://packages.gitlab.com/gitlab/gitlab-ce/

# Installation gitlab-ce Ubuntu 20

sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix

sudo tee /etc/apt/sources.list.d/gitlab_gitlab-ce.list<<EOF 
deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ bionic main
deb-src https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ bionic main
EOF

sudo apt update

sudo EXTERNAL_URL="http://192.168.0.X:9191/gitlab" apt-get install gitlab-ce

sudo nano /etc/gitlab/gitlab.rb

sudo gitlab-ctl reconfigure
sudo gitlab-rake “gitlab:password:reset”
# Installation Bugzilla


# Installation Sonarqube
https://www.digitalocean.com/community/tutorials/how-to-ensure-code-quality-with-sonarqube-on-ubuntu-18-04
https://developerinsider.co/install-sonarqube-on-ubuntu/
https://www.howtoforge.com/how-to-install-sonarqube-on-ubuntu-1804/
# Installation jenkins.io
Fuente:
https://www.jenkins.io/doc/book/installing/#debianubuntu
https://pkg.jenkins.io/debian-stable/
# Installation Mantis
apt update && apt upgrade -y

sudo apt install apache2 -y
sudo systemctl status apache2
https://www.howtoforge.com/how-to-install-and-configure-mantis-bug-tracker-on-ubuntu/


https://www.osradar.com/install-mantis-bug-tracker-ubuntu-20-04/
https://www.osradar.com/install-lamp-ubuntu-20-04/


# Installation elasticsearch
sudo apt-get install openjdk-8-jre
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add 
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.8/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.8.list



links

https://www.castsoftware.com
#Automated All-in-One OS command injection and exploitation tool. 
https://commixproject.com/

# Selenium con Python
apt install python3.8
apt install python3-pip

pip3 install selenium
pip3 install pyunitreport

chromedriver
https://chromedriver.storage.googleapis.com/index.html?path=83.0.4103.39/


monotoriar
https://haydenjames.io/20-top-server-monitoring-application-performance-monitoring-apm-solutions/

https://grafana.com/
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_7.0.4_amd64.deb
sudo dpkg -i grafana_7.0.4_amd64.deb

otra forma
wget https://dl.grafana.com/oss/release/grafana-7.0.4.linux-amd64.tar.gz
tar -zxvf grafana-7.0.4.linux-amd64.tar.gz
/grafana-7.0.4/bin$ ./grafana-server 



https://logging.apache.org/log4net/release/config-examples.html
https://stackify.com/retrace-error-monitoring/
