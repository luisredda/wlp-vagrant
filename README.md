# wlp-vagrant
Vagrant Webshere Liberty VM

Step 1: Download and Install VirtualBox

Step 2: Download and Install Vagrant.

Step 3: `git clone https://github.com/luisredda/wlp-vagrant.git`

    * cd wlp-vagrant
    
    * vagrant up
    
Vagrant will download and install the IBM JRE 1.7 and Websphere Liberty profile 18.0.0.1 and setup a simple hello world application in the port 8442.

Vagrant will configure a private network with ip 192.163.2.101. If you need to change network configuration just configure it in Vagrantfile.

To access the application just hit http://192.163.2.101:8442/hello-world/

*Basic Server Commands/Configuration*

- Stop Server: `./opt/wlp/bin/server stop liberty-server`
- Start Server: `./opt/wlp/bin/server start liberty-server`

- Deploy a new WAR: `Just copy the file to /opt/wlp/usr/servers/liberty-server/apps/`
- Server properties: `/opt/wlp/usr/servers/liberty-server/server.xml`
- JVM Arguments: `Just create/change /opt/wlp/usr/servers/liberty-server/jvm.options`
