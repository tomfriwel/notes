# Expand the capacity of the cloud disk

- [在线扩容云盘（Linux系统）](https://help.aliyun.com/document_detail/113316.htm?spm=a2c4g.11186623.0.0.79f36ee1OqUaIh#concept-syg-jxz-2hb)


```sh
fdisk -lu
df -Th
yum install -y cloud-utils-growpart
apt-get install -y cloud-guest-utils
growpart /dev/vdb 1

xfs_growfs [Path of Mounted on, df -Th to view]

# check
df -Th
```