#!/bin/bash

# This script automates the installation of Helm on Linux.
# It uses the official Helm installation script.

echo "Starting Helm installation on Linux..."

# Download the Helm installation script
echo "Downloading get_helm.sh script..."
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

# Make the script executable
echo "Making get_helm.sh executable..."
chmod 700 get_helm.sh

# Run the installation script
echo "Running Helm installation script..."
./get_helm.sh

# Clean up the downloaded script
echo "Cleaning up installation script..."
rm get_helm.sh

# Verify Helm installation
echo "Verifying Helm installation..."
helm version

echo "Helm installation complete!"
echo "Remember to ensure 'kubectl' is configured to your Kubernetes cluster."