# Day 09 — Linux User & Group Management Challenge

## Users & Groups Created
- **Users:** tokyo, berlin, professor, nairobi
- **Groups:** developers, admins, project-team

## Group Assignments
| User | Groups |
|------|--------|
| tokyo | developers, project-team |
| berlin | developers, admins |
| professor | admins |
| nairobi | project-team |

## Directories Created
| Directory | Group Owner | Permissions |
|-----------|-------------|-------------|
| `/opt/dev-project` | developers | 775 (rwxrwxr-x) |
| `/opt/team-workspace` | project-team | 775 (rwxrwxr-x) |

## Commands Used
```bash
# Task 1: Create users
sudo useradd -m tokyo && sudo passwd tokyo
sudo useradd -m berlin && sudo passwd berlin
sudo useradd -m professor && sudo passwd professor

# Verify
grep -E 'tokyo|berlin|professor' /etc/passwd
ls -l /home/

# Task 2: Create groups
sudo groupadd developers
sudo groupadd admins

# Verify
grep -E 'developers|admins' /etc/group

# Task 3: Assign users to groups
sudo usermod -aG developers tokyo
sudo usermod -aG developers,admins berlin
sudo usermod -aG admins professor

# Verify
groups tokyo
groups berlin
groups professor

# Task 4: Shared directory
sudo mkdir /opt/dev-project
sudo chgrp developers /opt/dev-project
sudo chmod 775 /opt/dev-project

# Test
sudo -u tokyo touch /opt/dev-project/tokyo-file.txt
sudo -u berlin touch /opt/dev-project/berlin-file.txt
ls -l /opt/dev-project/

# Task 5: Team workspace
sudo useradd -m nairobi && sudo passwd nairobi
sudo groupadd project-team
sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo
sudo mkdir /opt/team-workspace
sudo chgrp project-team /opt/team-workspace
sudo chmod 775 /opt/team-workspace
sudo -u nairobi touch /opt/team-workspace/nairobi-file.txt
ls -l /opt/team-workspace/
```

## What I Learned
- `useradd -m` creates a home directory; without it the user has no home
- `-aG` appends a user to supplementary groups without removing existing ones
- Group ownership with `chgrp` enables shared workspace access without world-writable permissions
