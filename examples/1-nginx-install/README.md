## Content for `helm-study-guide/examples/1-nginx-install/README.md`

markdown
# Example 1: Installing Nginx with Helm

This example walks you through the process of installing, updating, rolling back, and uninstalling an Nginx application using Helm.

### Prerequisites

* A running Kubernetes cluster.
* Helm installed and configured (see main `README.md` for installation instructions).
* `kubectl` configured to connect to your cluster.

### Steps

1.  **Add the `bitnami` repository:**
    Bitnami provides many popular and well-maintained Charts.
    
		helm repo add bitnami [https://charts.bitnami.com/bitnami](https://charts.bitnami.com/bitnami)
    
    Expected output: `"bitnami" has been added to your repositories`

2.  **Update your Helm repositories:**
    This ensures you have the latest Chart information from all configured repositories.
    
		helm repo update
    
    Expected output: `Successfully got an update from the "bitnami" chart repository`

3.  **Search for the Nginx Chart:**
    
		helm search repo nginx
    
    Look for the `bitnami/nginx` Chart in the results.

4.  **Install the Nginx Chart:**
    We'll install Nginx and name this specific deployment `my-nginx`.
    
		helm install my-nginx bitnami/nginx
    
    You should see output indicating the successful deployment, including notes on how to access Nginx.

5.  **List installed releases:**
    Verify that `my-nginx` is listed.
    
		helm list
    

6.  **Check the status of the `my-nginx` release:**
    This command shows details about the deployed resources.
    
		helm status my-nginx
    

7.  **Get the current values of the Nginx Chart:**
    We'll save the default values to `nginx-values.yaml` to prepare for an upgrade.
    
		helm show values bitnami/nginx > nginx-values.yaml
    
    * **Note:** You can open the `nginx-values.yaml` file in this directory to see the default configuration.

8.  **Modify `nginx-values.yaml` to change replica count:**
    Open the `nginx-values.yaml` file located in `examples/1-nginx-install/` and change the `replicaCount` to `2`.
    yaml
    # ... other configurations
    replicaCount: 2
    # ... other configurations
    

9.  **Upgrade the `my-nginx` release with the new values:**
    
		helm upgrade my-nginx bitnami/nginx -f nginx-values.yaml
    
    Verify the change by running `kubectl get deployments`. You should see 2 Nginx replicas.

10. **View the release history:**
    Observe the two revisions: the initial install and the upgrade.
    
		helm history my-nginx
    

11. **Roll back to the previous revision (Revision 1):**
    If the upgrade caused issues, you can easily revert.
    
		helm rollback my-nginx 1
    
    Verify the change again with `kubectl get deployments`. You should now see 1 Nginx replica.

12. **Uninstall the `my-nginx` release:**
    This will remove all Kubernetes resources created by this Helm release.
    
		helm uninstall my-nginx
    
    You can confirm it's gone with `helm list` and `kubectl get all -l app.kubernetes.io/instance=my-nginx`.