# Day 55 — Persistent Volumes and Persistent Volume Claims

## Problem
- `emptyDir` volume is deleted when pod is removed
- Data loss demo: wrote file in emptyDir pod → deleted pod → data gone

## PV/PVC Relationship
- PV = cluster storage resource (admin provisions)
- PVC = storage request (user claims)
- PVC binds to PV when requirements match (capacity, access modes)
- Pod uses PVC as a volume → PV remains bound even if pod is deleted

## Static vs Dynamic
- **Static:** Admin creates PV → PVC binds to it (`Retain` policy → PV status `Released` after PVC deletion, not reusable)
- **Dynamic:** PVC with `storageClassName` triggers automatic PV creation via StorageClass (`Delete` policy → PV deleted when PVC is deleted)

## Access Modes & Reclaim Policies
| Access Mode | Description |
|-------------|-------------|
| ReadWriteOnce | Single node read-write |
| ReadOnlyMany | Multiple nodes read-only |
| ReadWriteMany | Multiple nodes read-write |

| Reclaim Policy | Behavior on PVC delete |
|----------------|------------------------|
| Retain | PV kept (manual reclamation) |
| Delete | PV and storage deleted |
| Recycle | PV scrubbed (deprecated) |
