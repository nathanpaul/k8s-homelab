#!/usr/bin/env bash
#
# create-nfs-dirs.sh
# 
# This script creates all of the base paths and directories expected by the Kubernetes NFS CSI driver
# and other explicit NFS mounts found in the cluster (like VolSync and Jellyfin).
#
# It accounts for directories that already exist because of the `mkdir -p` command.
# This script should ideally be run on the NFS server or a system with root-level access to the NFS mount paths.

set -e

echo "Starting NFS directory creation..."

# Define all required NFS base directories and explicit mounts based on the Kubernetes configurations
NFS_DIRECTORIES=(
    # General K8s dynamically provisioned sub-directories go here
    "/mnt/user/k8s"

    # Specific static NFS applications
    "/mnt/user/k8s/jellyfin-media"
    "/mnt/user/k8s/volsync-kopia-nfs"
)

# Iterate through the array and create directories
for dir in "${NFS_DIRECTORIES[@]}"; do
    if [ -d "$dir" ]; then
        echo "✅ Directory already exists: $dir"
    else
        echo "Creating directory: $dir"
        mkdir -p "$dir"
        echo "✅ Created: $dir"
    fi
done

echo "Attempting to fix permissions on base writable directories (optional but recommended for K8s CSI)..."
# The CSI driver often needs broad write permissions because pods run as various sub-UIDs.
# Adjust these lines if you have a more strict user/group mapping setup!
chmod 777 /mnt/user/k8s || true
chmod 777 /mnt/user/k8s/jellyfin-media || true
chmod 777 /mnt/user/k8s/volsync-kopia-nfs || true

echo "Done! All required NFS directories have been verified/created."
