# Day 13 — LVM Practice

## Commands Run
```bash
# Create a virtual disk for LVM practice
dd if=/dev/zero of=/tmp/lvm-disk.img bs=1M count=1024
losetup -fP /tmp/lvm-disk.img
losetup -a
# → /dev/loop0

# Check current storage
lsblk
pvs   # (empty initially)
vgs   # (empty initially)
lvs   # (empty initially)

# Create Physical Volume
pvcreate /dev/loop0
pvs
# → PV /dev/loop0 VG lvm-demo-vg lvm2 <1024.00m

# Create Volume Group
vgcreate devops-vg /dev/loop0
vgs
# → VG devops-vg PV 1 <1024.00m

# Create Logical Volume
lvcreate -L 500M -n app-data devops-vg
lvs
# → LV app-data VG devops-vg 500.00m

# Format and Mount
mkfs.ext4 /dev/devops-vg/app-data
mkdir -p /mnt/app-data
mount /dev/devops-vg/app-data /mnt/app-data
df -h /mnt/app-data
# → 476M available

# Extend the Volume
lvextend -L +200M /dev/devops-vg/app-data
resize2fs /dev/devops-vg/app-data
df -h /mnt/app-data
# → 672M available (extended successfully)
```

## What I Learned
- LVM provides flexible storage management — volumes can be resized without downtime
- The stack is: Physical Volume → Volume Group → Logical Volume → Filesystem
- `lvextend` + `resize2fs` must both be run to make the new space available
