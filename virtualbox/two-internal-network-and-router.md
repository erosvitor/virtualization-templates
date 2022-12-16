# Two internal network and one router

## Steps

1. Create three Linux VMs

### Setting VM 1

1. Set the Adapter 1 as 'NAT'

2. Enable the Adapter 2 as 'Internal Network' and rename to 'net-1'

3. Enable the Adapter 3 as 'Internal Network' and rename to 'net-2'

4. Edit the file /etc/network/interfaces and change the content to:
```
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto enp0s3
iface enp0s3 inet dhcp

auto enp0s8
iface enp0s8 inet static
  address 20.10.1.1
  netmask 255.255.255.0

auto enp0s9
iface enp0s9 inet static
  address 20.10.2.1
  netmask 255.255.255.0
```

5. Edit the file /etc/sysctl.conf and remove the commentary of line
```
#net.ipv4.ip_forward=1
```

6. Reboot the VM Router


### Setting VM 2
    
1. Set the Adapter 1 as 'Internal Network' and rename to 'net-1'

2. Edit the file /etc/network/interfaces and change the content to:
```
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto enp0s3
iface enp0s3 inet static
  address 20.10.1.100
  netmask 255.255.255.0
  gateway 10.0.2.15
```

3. Restart the network service
```
$ sudo /etc/init.d/networking restart
```

### Setting VM 3
   
1. Set the Adapter 1 as 'Internal Network' and rename to 'net-2'

2. Edit the file /etc/network/interfaces and change the content to:
```
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto enp0s3
iface enp0s3 inet static
  address 20.10.2.200
  netmask 255.255.255.0
  gateway 10.0.2.15
```

3. Restart the network service
```
$ sudo /etc/init.d/networking restart
```
