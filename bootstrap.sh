#!/usr/bin/env bash

#apt-get update

#INSTALL IBM JRE x64 1.7
echo "Downloading IBM JRE..."
wget -c "http://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/7.0.10.25/linux/x86_64/ibm-java-jre-7.0-10.25-x86_64-archive.bin" -nv

echo "Installing IBM JRE..."
chmod 777 ibm-java-jre-7.0-10.25-x86_64-archive.bin
./ibm-java-jre-7.0-10.25-x86_64-archive.bin -i silent -f /home/vagrant/shared/jre.properties 1>console.txt 2>&1
#/home/vagrant/shared/ibm-java-jre-7.0-10.25-x86_64-archive.bin -i silent -f /home/vagrant/shared/jre.properties 1>console.txt 2>&1

#SET JAVA_HOME AND PATH ENV VARIABLES
echo "Setting Env Variables"
export JAVA_HOME=/opt/java/ibm-java-x86_64-70/jre
export PATH=$JAVA_HOME/bin:$PATH

touch /etc/profile.d/jre.sh
echo "export JAVA_HOME=/opt/java/ibm-java-x86_64-70/jre" > /etc/profile.d/jre.sh
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile.d/jre.sh
chmod 777 /etc/profile.d/jre.sh

echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf

sudo sysctl -p

echo "Downloading Liberty Profile 18.0.0.1"
wget -c "https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/downloads/wlp/18.0.0.1/wlp-runtime-18.0.0.1.jar" -nv
chmod 777 wlp-runtime-18.0.0.1.jar

#INSTALL WEBSPHERE LIBERTY PROFILE
echo "Installing Websphere Liberty Profile 18.0.0.1"
java -jar wlp-runtime-18.0.0.1.jar --acceptLicense /opt/

#CREATE SERVER
/opt/wlp/bin/server create liberty-server

#START SERVER
/opt/wlp/bin/server start liberty-server

/opt/wlp/bin/installUtility install jsp-2.3 --acceptLicense

#STOP SERVER
/opt/wlp/bin/server stop liberty-server

#COPY HELLO WORLD APP AND SERVER CONFIG
cp /home/vagrant/shared/hello-world.war /opt/wlp/usr/servers/liberty-server/apps/hello-world.war
cp -rf /home/vagrant/shared/server.xml /opt/wlp/usr/servers/liberty-server/server.xml

#RESTART server
/opt/wlp/bin/server start liberty-server

echo "Done! You can access the Hello World App using http://192.163.2.101:8442/hello-world/"
