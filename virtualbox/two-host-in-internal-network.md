# Two hosts in internal network

## Steps

1. Create two Linux VMs

2. Set adapter 1 as 'Internal Network' in both VMs

3. Start the VM1 and change the file /etc/network/interfaces to:
```
auto lo eth0
iface lo inet loopback

iface eth0 inet static
  address 20.10.0.100
  netmask 255.255.255.0
```

4. Restart the interface eth0
```
$ sudo ifdown eth0
$ sudo ifup eth0
```

5. Start the VM2 and change the file /etc/network/interfaces to:
```
auto lo eth0
iface lo inet loopback

iface eth0 inet static
  address 20.10.0.101
  netmask 255.255.255.0
```

6. Restart the interface eth0
```
$ sudo ifdown eth0
$ sudo ifup eth0
```

7. Check if both VMs are visible
```
In VM1, run the command

  $ ping 20.10.0.101

In VM2, run the command

  $ ping 20.10.0.100
```

8. Access VM2 from VM1 by SSH
```
$ ssh <username-in-vm2>@20.10.0.101 
```
