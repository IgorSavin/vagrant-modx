# устанавливаем XAMPP
wget https://www.apachefriends.org/xampp-files/5.6.23/xampp-linux-x64-5.6.23-0-installer.run
chmod 755 xampp-linux-x64-5.6.23-0-installer.run
sudo ./xampp-linux-x64-5.6.23-0-installer.run

# меняем права доступа с Require local на Require all granted в конфиге XAMPP
T=`tempfile`
sed 's/Require local/Require all granted/' /opt/lampp/etc/extra/httpd-xampp.conf > $T
sudo mv $T /opt/lampp/etc/extra/httpd-xampp.conf

# включаем вируальные хосты
T=`tempfile`
sed 's/#Include etc\/extra\/httpd-vhosts.conf/Include etc\/extra\/httpd-vhosts.conf/' /opt/lampp/etc/httpd.conf > $T
sudo mv $T /opt/lampp/etc/httpd.conf

# копируем конфиг с виртуальными хостами
sudo cp -f /vagrant/vhosts.conf /opt/lampp/etc/extra/httpd-vhosts.conf

# запускаем XAMPP
sudo /opt/lampp/lampp restart

# загружаем modx
wget https://modx.com/download/direct/modx-2.5.1-pl.zip
sudo apt-get install unzip
sudo unzip modx-2.5.1-pl.zip -d /opt/lampp/htdocs/
cp -rp modx-2.5.1-pl/* modx/