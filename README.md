 Helm Study Guide

Welcome to the Helm Study Guide! This repository provides a comprehensive guide to understanding and using Helm, the package manager for Kubernetes.

---

1. Introduction to Helm

Helm is the **package manager for Kubernetes**. Like `apt`, `yum`, or `npm` for other operating systems or programming languages, Helm simplifies the deployment and management of applications on Kubernetes clusters. It allows developers and operators to package, configure, and deploy applications reproducibly.

Why Use Helm?

* **Simplification:** Packages multiple Kubernetes resources (Deployments, Services, Ingresses, etc.) into a single unit called a **Chart**.
* **Reusability:** Charts can be shared and reused, making it easier to deploy common applications.
* **Version Management:** Allows control over the versions of deployed applications, facilitating updates and rollbacks.
* **Dynamic Configuration:** Charts can be easily configured with different values for different environments (development, staging, production).
* **Lifecycle Management:** Facilitates the installation, updating, rolling back, and uninstallation of applications.

Key Concepts

* **Chart:** A Helm package that contains all the information needed to install an application or a set of applications on a Kubernetes cluster. A Chart is a directory containing configuration files and templates.
* **Release:** An instance of a Chart running on a Kubernetes cluster. When you install a Chart, Helm creates a Release with a unique name.
* **Repository:** A place where Charts are stored and shared. Repositories are essentially HTTP servers that serve Chart files.
* **Values:** A file (usually `values.yaml`) within a Chart that defines default configuration values. These values can be overridden during the installation or upgrade of a Chart.
* **Templates:** Files within a Chart (located in the `templates/` folder) that contain Kubernetes resource definitions (`.yaml`) with placeholders. Helm renders these templates using the provided values to generate the final Kubernetes manifests.

---

2. Helm Installation

Helm is a command-line tool, so its installation is quite straightforward on most operating systems.

Prerequisites

Before installing Helm, make sure you have:

* **kubectl:** The Kubernetes command-line tool, configured to connect to your Kubernetes cluster.
* **A running Kubernetes cluster:** This can be local (like Minikube, Kind, Docker Desktop with Kubernetes) or in the cloud (GKE, AKS, EKS, etc.).

*** Installation on Linux

The easiest way to install Helm on Linux is via `snap` or by downloading the binary.

Option 1: Using Snap (Recommended for Ubuntu/Debian)

```bash
sudo snap install helm --classic

Option 2: Using the Installation Script
Visit the Helm releases page on GitHub.

Download the appropriate version for your architecture (e.g., helm-vX.Y.Z-linux-amd64.tar.gz).

Unzip the file:

Bash

tar -zxvf helm-vX.Y.Z-linux-amd64.tar.gz
Move the helm binary to your $PATH (e.g., /usr/local/bin/):

Bash

sudo mv linux-amd64/helm /usr/local/bin/helm

*** Installation on Windows
On Windows, you can install Helm using Chocolatey, Scoop, or by downloading the binary.

Option 1: Using Chocolatey (Recommended)
If you have Chocolatey (a package manager for Windows) installed:

PowerShell

choco install kubernetes-helm

Option 2: Using Scoop
If you have Scoop (another package manager for Windows) installed:

PowerShell

scoop install helm

Option 3: Manual Binary Download
Visit the Helm releases page on GitHub.

Download the appropriate version for your architecture (e.g., helm-vX.Y.Z-windows-amd64.zip).

Unzip the ZIP file.

Move the helm.exe executable to a location that is in your system Path (for example, C:\Program Files\Helm and add that path to the Path environment variable).

Installation Verification
After installation, verify that Helm is working correctly:

Bash

helm version
You should see the installed Helm version.

3. Most Used Helm Commands
Here are the Helm commands you'll use most frequently in your day-to-day work:

Command                                      Description

helm help                                    Shows general help or specific help for a command.

helm version                                 Shows the installed Helm version.

helm repo add [NAME] [URL]                   Adds a new Chart repository.

helm repo list								 Lists configured Chart repositories.

helm repo update                             Updates Chart information from all repositories.

helm search repo [KEYWORD]                   Searches for Charts in configured repositories.

helm search hub [KEYWORD]                    Searches for Charts on Artifact Hub (a centralized registry for CNCF Charts and other artifacts).

helm install [NAME] [CHART]                  Installs a Chart on the cluster, creating a new Release.

helm upgrade [RELEASE_NAME] [CHART]          Upgrades an existing Release with a new Chart version or new values.

helm rollback [RELEASE_NAME] [REVISION]      Rolls back a Release to a previous revision.

helm uninstall [RELEASE_NAME]                Uninstalls a Release, deleting all associated Kubernetes resources.

helm list                                    Lists all Releases in the cluster.

helm status [RELEASE_NAME]                   Shows the status of a specific Release.

helm history [RELEASE_NAME]                  Shows the revision history of a Release.

helm show values [CHART]                     Shows the default values of a Chart.

helm create [NAME]                           Creates a new Chart with a basic structure to start developing your own Chart.

helm lint [CHART_PATH]                       Analyzes a local Chart for errors and best practices.

helm package [CHART_PATH]                    Packages a Chart into a .tgz file for distribution.