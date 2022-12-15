#!/bin/bash

#####################################################################################################
# Tools
#####################################################################################################
apt update
apt install openjdk-8-jdk -y

#####################################################################################################
# Nexus
#####################################################################################################
wget https://download.sonatype.com/nexus/3/nexus-3.42.0-01-unix.tar.gz
tar xf nexus-3.42.0-01-unix.tar.gz
mv nexus-3.42.0-01/ /opt
mv sonatype-work/ /opt

useradd -M -d /opt/nexus-3.42.0-01 -s /bin/bash -r nexus
echo "nexus ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nexus
chown -R nexus:nexus /opt/nexus-3.42.0-01/
chown -R nexus:nexus /opt/sonatype-work/
sed -i 's/#run_as_user=""/run_as_user="nexus"/' /opt/nexus-3.42.0-01/bin/nexus.rc

cat > /etc/systemd/system/nexus.service << 'EOL'
[Unit]
Description=Nexus repository
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus-3.42.0-01/bin/nexus start
ExecStop=/opt/nexus-3.42.0-01/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOL

systemctl start nexus
systemctl enable nexus

