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

