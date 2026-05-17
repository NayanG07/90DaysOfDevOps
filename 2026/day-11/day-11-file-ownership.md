# Day 11 — File Ownership Challenge

## Files & Directories Created
- `devops-file.txt`, `team-notes.txt`, `project-config.yaml`
- `app-logs/` directory
- `heist-project/` with `vault/gold.txt`, `plans/strategy.conf`
- `bank-heist/` with `access-codes.txt`, `blueprints.pdf`, `escape-plan.txt`

## Ownership Changes
| File/Dir | Before | After |
|----------|--------|-------|
| devops-file.txt | kirito:kirito | tokyo:heist-team |
| team-notes.txt | kirito:kirito | kirito:heist-team |
| project-config.yaml | kirito:kirito | professor:heist-team |
| app-logs/ | kirito:kirito | berlin:heist-team |
| heist-project/ (recursive) | kirito:kirito | professor:planners |
| bank-heist/access-codes.txt | kirito:kirito | tokyo:vault-team |
| bank-heist/blueprints.pdf | kirito:kirito | berlin:tech-team |
| bank-heist/escape-plan.txt | kirito:kirito | nairobi:vault-team |

## Commands Used
```bash
# Task 2
touch devops-file.txt
sudo chown tokyo devops-file.txt
sudo chown berlin devops-file.txt

# Task 3
touch team-notes.txt
sudo groupadd heist-team
sudo chgrp heist-team team-notes.txt

# Task 4
touch project-config.yaml
sudo chown professor:heist-team project-config.yaml
mkdir app-logs/
sudo chown berlin:heist-team app-logs/

# Task 5
mkdir -p heist-project/vault heist-project/plans
touch heist-project/vault/gold.txt heist-project/plans/strategy.conf
sudo groupadd planners
sudo chown -R professor:planners heist-project/
ls -lR heist-project/

# Task 6
mkdir bank-heist
touch bank-heist/access-codes.txt bank-heist/blueprints.pdf bank-heist/escape-plan.txt
sudo groupadd vault-team tech-team
sudo chown tokyo:vault-team bank-heist/access-codes.txt
sudo chown berlin:tech-team bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt
ls -l bank-heist/
```

## What I Learned
- `chown owner:group file` changes both owner and group in one command
- `chown -R` applies ownership changes recursively through a directory tree
- User and group must exist before `chown`/`chgrp` can assign them
