curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
Hit:1 http://se.archive.ubuntu.com/ubuntu focal InRelease
Get:2 http://se.archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]                                     
Get:3 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]                                      
Get:4 http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04  InRelease [1.642 B]
Get:5 http://se.archive.ubuntu.com/ubuntu focal-backports InRelease [108 kB]                           
Get:6 http://se.archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [2.981 kB]
Get:7 http://se.archive.ubuntu.com/ubuntu focal-updates/main i386 Packages [912 kB]
Get:8 http://se.archive.ubuntu.com/ubuntu focal-updates/main Translation-en [484 kB]
Get:9 http://se.archive.ubuntu.com/ubuntu focal-updates/main amd64 DEP-11 Metadata [275 kB]
Get:10 http://se.archive.ubuntu.com/ubuntu focal-updates/restricted amd64 Packages [2.516 kB]
Get:11 http://se.archive.ubuntu.com/ubuntu focal-updates/restricted Translation-en [351 kB]
Get:12 http://se.archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [1.134 kB]
Get:13 http://se.archive.ubuntu.com/ubuntu focal-updates/universe i386 Packages [757 kB]
Get:14 http://se.archive.ubuntu.com/ubuntu focal-updates/universe Translation-en [270 kB]
Get:15 http://se.archive.ubuntu.com/ubuntu focal-updates/universe amd64 DEP-11 Metadata [414 kB]
Get:16 http://se.archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 Packages [25,8 kB]
Get:17 http://se.archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 DEP-11 Metadata [940 B]
Get:18 http://se.archive.ubuntu.com/ubuntu focal-backports/main amd64 DEP-11 Metadata [7.968 B]
Get:19 http://se.archive.ubuntu.com/ubuntu focal-backports/universe amd64 DEP-11 Metadata [30,5 kB]
Get:20 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages [2.593 kB]
Get:21 http://security.ubuntu.com/ubuntu focal-security/main i386 Packages [679 kB]
Get:22 http://security.ubuntu.com/ubuntu focal-security/main Translation-en [401 kB]
Get:23 http://security.ubuntu.com/ubuntu focal-security/main amd64 DEP-11 Metadata [59,9 kB]
Get:24 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 Packages [2.398 kB]
Get:25 http://security.ubuntu.com/ubuntu focal-security/restricted Translation-en [335 kB]
Get:26 http://security.ubuntu.com/ubuntu focal-security/universe i386 Packages [623 kB]
Get:27 http://security.ubuntu.com/ubuntu focal-security/universe amd64 Packages [901 kB]
Get:28 http://security.ubuntu.com/ubuntu focal-security/universe Translation-en [189 kB]
Get:29 http://security.ubuntu.com/ubuntu focal-security/universe amd64 DEP-11 Metadata [96,6 kB]
Get:30 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 Packages [23,6 kB]
Get:31 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 DEP-11 Metadata [940 B]
Fetched 18,8 MB in 5s (3.977 kB/s)                                        
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
lsb-release is already the newest version (11.1.0ubuntu2).
lsb-release set to manually installed.
curl is already the newest version (7.68.0-1ubuntu2.20).
gnupg is already the newest version (2.2.19-3ubuntu2.2).
gnupg set to manually installed.
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 143 not upgraded.
Need to get 1.704 B of archives.
After this operation, 162 kB of additional disk space will be used.
Get:1 http://se.archive.ubuntu.com/ubuntu focal-updates/universe amd64 apt-transport-https all 2.0.10 [1.704 B]
Fetched 1.704 B in 0s (26,7 kB/s)        
Selecting previously unselected package apt-transport-https.
(Reading database ... 241945 files and directories currently installed.)
Preparing to unpack .../apt-transport-https_2.0.10_all.deb ...
Unpacking apt-transport-https (2.0.10) ...
Setting up apt-transport-https (2.0.10) ...
Hit:1 http://se.archive.ubuntu.com/ubuntu focal InRelease
Hit:2 http://se.archive.ubuntu.com/ubuntu focal-updates InRelease                                                                    
Hit:3 http://security.ubuntu.com/ubuntu focal-security InRelease                                                                       
Hit:4 http://se.archive.ubuntu.com/ubuntu focal-backports InRelease                                                                    
Get:5 http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04  InRelease [1.642 B]               
Get:6 https://packages.microsoft.com/repos/azure-cli focal InRelease [3.575 B]                                 
Get:7 https://packages.microsoft.com/repos/azure-cli focal/main all Packages [4.106 B]
Get:8 https://packages.microsoft.com/repos/azure-cli focal/main amd64 Packages [1.151 B]
Fetched 10,5 kB in 1s (7.743 B/s)     
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  azure-cli
0 upgraded, 1 newly installed, 0 to remove and 143 not upgraded.
Need to get 63,8 MB of archives.
After this operation, 803 MB of additional disk space will be used.
Get:1 https://packages.microsoft.com/repos/azure-cli focal/main amd64 azure-cli amd64 2.54.0-1~focal [63,8 MB]
Fetched 63,8 MB in 6s (11,1 MB/s)    
Selecting previously unselected package azure-cli.
(Reading database ... 241949 files and directories currently installed.)
Preparing to unpack .../azure-cli_2.54.0-1~focal_amd64.deb ...
Unpacking azure-cli (2.54.0-1~focal) ...
Setting up azure-cli (2.54.0-1~focal) ...

