#!/bin/bash

# Verificar si se ejecuta como root
if [[ $EUID -ne 0 ]]; then
  echo "Este script debe ejecutarse como root. Usa: sudo ./install-dev-tools.sh"
  exit 1
fi

echo "Actualizando el sistema..."
apt update && apt upgrade -y

echo "Instalando dependencias básicas..."
apt install -y curl wget unzip git openjdk-11-jdk apt-transport-https ca-certificates software-properties-common python3-pip

# ============================================
# GitLab CE
# ============================================
echo "Instalando GitLab CE..."
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
apt install -y gitlab-ce
gitlab-ctl reconfigure

# ============================================
# Bugzilla
# ============================================
echo "Instalando Bugzilla..."
apt install -y apache2 libapache2-mod-perl2 libapache2-mod-perl2-dev make gcc \
  libmysqlclient-dev mysql-client mysql-server libdatetime-perl libdatetime-timezone-perl \
  libdbi-perl libdbd-mysql-perl libappconfig-perl libtemplate-perl libmime-tools-perl \
  libsoap-lite-perl libapache2-mod-perl2
wget https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla-LATEST.tar.gz
tar -xvzf bugzilla-LATEST.tar.gz -C /var/www/html
cd /var/www/html/bugzilla
./checksetup.pl --check-modules
./checksetup.pl

# ============================================
# SonarQube
# ============================================
echo "Instalando SonarQube..."
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip
unzip sonarqube-9.9.0.65466.zip -d /opt
mv /opt/sonarqube-9.9.0.65466 /opt/sonarqube
adduser --system --no-create-home --group --disabled-login sonarqube
chown -R sonarqube:sonarqube /opt/sonarqube
su - sonarqube -c "/opt/sonarqube/bin/linux-x86-64/sonar.sh start"

# ============================================
# Jenkins
# ============================================
echo "Instalando Jenkins..."
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update && apt install -y jenkins
systemctl start jenkins
systemctl enable jenkins

# ============================================
# MantisBT
# ============================================
echo "Instalando Mantis Bug Tracker..."
wget https://sourceforge.net/projects/mantisbt/files/latest/download -O mantisbt-latest.zip
unzip mantisbt-latest.zip -d /var/www/html/
mv /var/www/html/mantisbt-* /var/www/html/mantisbt
chown -R www-data:www-data /var/www/html/mantisbt
mysql -e "CREATE DATABASE mantisbt; CREATE USER 'mantisbt'@'localhost' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON mantisbt.* TO 'mantisbt'@'localhost';"
systemctl restart apache2

# ============================================
# Elasticsearch
# ============================================
echo "Instalando Elasticsearch..."
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list'
apt update && apt install -y elasticsearch
systemctl enable elasticsearch
systemctl start elasticsearch

# ============================================
# Selenium con Python
# ============================================
echo "Instalando Selenium para Python..."
pip3 install selenium
apt install -y chromium-chromedriver
echo "Selenium con Python y ChromeDriver instalado."

# ============================================
# Grafana
# ============================================
echo "Instalando Grafana..."
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
apt update && apt install -y grafana
systemctl start grafana-server
systemctl enable grafana-server

# ============================================
# Otras herramientas útiles
# ============================================

# Instalar Docker para facilitar la creación de entornos de desarrollo
echo "Instalando Docker..."
apt install -y docker.io
systemctl enable --now docker
usermod -aG docker $USER

# Instalar Postman (versión de CLI: Newman)
echo "Instalando Postman CLI (Newman)..."
npm install -g newman

# Instalar Gatling para pruebas de carga
echo "Instalando Gatling..."
wget https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/3.7.6/gatling-charts-highcharts-bundle-3.7.6-bundle.zip
unzip gatling-charts-highcharts-bundle-3.7.6-bundle.zip -d /opt
ln -s /opt/gatling-charts-highcharts-bundle-3.7.6 /opt/gatling

echo "Instalación completada. Las siguientes herramientas están instaladas:"
echo "GitLab CE, Bugzilla, SonarQube, Jenkins, MantisBT, Elasticsearch, Selenium con Python, Grafana, Docker, Postman CLI (Newman), Gatling."
