# https://www.youtube.com/watch?v=AGSeER8L87I
# Video wih basic linux terminal command I perform in a virual machine


Virtual box machine – 1 CPU, 1024MB RAM, 16GB hard drive + 2GB another hard drive, 2 network adapters(lan cards) – 1 connection, 1 for networking. System Distribution – AlmaLinux 8.6 (Red Hat, Fedora family)
In Linux almost all is plain txt files and directories in which they are stored
__________________________________________________
Users, Dirs, files:
sudo dnf -y upgrade    
whoami   
id zefir    
pwd   - in which folder I am
ls   
ls /   - showing what files there is in a specific folder - in this case the "root" folder - /
cat /etc/passwd   - opening the file and reading it with Cat (concatenate) command - in this case showing all the users in the system.
Ctrl + l   - clearing the screen
History   - showing all the previous commands
cat /etc/group   - showing all the groups in the system
sudo useradd -m -c "Project Developer" developer   - creating a username with a home folder (-m) with full name (-c) and the username name (in this case "developer")
sudo passwd developer      - creating/changing the password of the username in this case developer
sudo usermod -aG wheel developer    - appending the user developer to the wheel group and giving it sudo (administrative) rights (fedora/red hat family specific. For other distributions the sudo group might be different)
sudo mkdir -p /shared/projects/projectXYZ/Stage{1..3}/{DOCUMENTS,BUDGET}   -  creating multiple folders with specific path – if the folder doesn’t exist it will be created (-p) command
sudo touch /shared/projects/projectXYZ/Stage{1..3}/DOCUMENTS/document{1..5}.doc    - creating multiple files with specific number at specific PATH
sudo touch /shared/projects/projectXYZ/Stage{1..3}/BUDGET/readme_{en,bg,de}.txt
cd (PATH)   - moving through folders
cp /etc/services .    - copy the services file in the current folder
grep -E '^[#]' services (angled brackets right) services_comments.txt   - find all the lines which start with “#” in the services file and write them in a newly created file services_comments.txt
pstree -p 1 (angled brackets right) processes-tree.txt  
cat (angled brackets right) doc1.txt (double angled brackets left) END   - dynamically add text in a file(in this case doc1.txt) until END is typed
Entering
Some
Text
END
Networking, programs installation, firewall, edit grub2 (the boot file)

Hostnamectl   -
ip a
sudo nmcli connection add type ethernet ifname enp0s8 con-name enp0s8
sudo nmcli connection modify enp0s8 ipv4.addresses 192.168.200.1/24 ipv4.method manual
nmtui   -restart the connection 

sudo dnf install httpd  - Install the APACHE http server
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
systemctl status firewalld
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
sudo vi /etc/default/grub  -Edit grub file(how the system to boot)
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
df -h
_____________________________________
sudo vi stars.sh  -Making the file stars.sh using the VIM editor. watch a youtube video how to use VIM.  IF you don't know how to exit the editor: type ESC + ESC, then type ":q"
#!/bin/bash

if [ $# -ne 1 ]; then
   echo 'error. Add an integer as a second parameter'
   exit 1
fi

for i in $(seq 1 $1); do
        echo -n '*'
done
echo ""
exit 0

sudo chmod +x stars.sh   - changing the permissions the executable
./stars.sh   - staring the script
Hard disks:

lsblk -f
sudo dnf install gdisk
sudo gdisk /dev/sdb  - entering with gdisk in sdb hard disk
n
1500M
8e00
p
w  -creating logical volume (type 8e00) with 1500Mib disk space

sudo pvcreate /dev/sdb1  -creating physical volume – sdb1
sudo pvscan
sudo vgcreate vg1 /dev/sdb1  -creating volume group sdb1
sudo vgscan
sudo lvcreate -n lv1 -l 100%FREE vg1  -creating logical volume with up to all free 1500Mib
sudo lvscan
sudo mkfs.xfs -L LVM-XFS /dev/vg1/lv1   -creating filesystem type XFS in the logical volume
sudo mkdir -p /disks/lvm  
sudo mount /dev/vg1/lv1 /disks/lvm   -mounting 
lsblk -f
sudo -vi /etc/fstab    - CAREFULLY editing the fstab file
sudo umount /disks/lvm
sudo reboot
