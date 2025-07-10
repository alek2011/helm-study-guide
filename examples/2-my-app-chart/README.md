# Example 2: Creating Your Own Helm Chart

This example guides you through the process of creating a basic Helm Chart from scratch, linting it, and understanding its structure.

### Prerequisites

* A running Kubernetes cluster (optional for creation/linting, but needed for deployment).
* Helm installed and configured.

### Steps

1.  **Create a new Helm Chart skeleton:**
    Navigate to the `examples/2-my-app-chart/` directory and run the `helm create` command.
    
		cd examples/2-my-app-chart/
		helm create my-app
    
    This command generates a basic Chart structure named `my-app` within the current directory.

2.  **Explore the Chart structure:**
    Examine the files and directories created inside `my-app/`.
    
    my-app/
      ├── Chart.yaml          # Defines Chart metadata (name, version, description)
      ├── values.yaml         # Contains default configuration values for your application
      ├── charts/             # Empty by default, for dependent charts (subcharts)
      ├── templates/          # Contains Kubernetes manifest templates
      │   ├── NOTES.txt         # Text displayed after successful installation
      │   ├── _helpers.tpl      # Reusable template snippets and functions
      │   ├── deployment.yaml   # Template for a Kubernetes Deployment
      │   ├── ingress.yaml      # Template for a Kubernetes Ingress (optional)
      │   ├── service.yaml      # Template for a Kubernetes Service
      │   ├── serviceaccount.yaml # Template for a Kubernetes ServiceAccount (optional)
      │   └── tests/              # Directory for Chart tests
      │       └── test-connection.yaml # Example test
      └── .helmignore         # Files to ignore when packaging the Chart
    

3.  **Inspect `Chart.yaml`:**
    Open `my-app/Chart.yaml`. This file contains important metadata about your Chart.
    yaml
    # my-app/Chart.yaml
    apiVersion: v2
    name: my-app
    description: A Helm chart for Kubernetes
    # ... other fields
    type: application
    version: 0.1.0
    appVersion: "1.16.0" # This is the version of your *application*, not the Chart
    
    You can modify `description`, `version`, and `appVersion` as your application evolves.

4.  **Inspect `values.yaml`:**
    Open `my-app/values.yaml`. This file defines the default configurable parameters for your Chart.
    yaml
    # my-app/values.yaml
    replicaCount: 1

    image:
      repository: nginx
      pullPolicy: IfNotPresent
      # Overrides the image tag whose default is the chart appVersion.
      tag: ""

    service:
      type: ClusterIP
      port: 80

    ingress:
      enabled: false
      className: ""
      annotations: {}
        # kubernetes.io/ingress.class: nginx
        # kubernetes.io/tls-acme: "true"
      hosts:
        - host: chart-example.local
          paths:
            - path: /
              pathType: ImplementationSpecific
      tls: []
      #  - secretName: chart-example-tls
      #    hosts:
      #      - chart-example.local
    # ... much more
    
    These values are used to populate the templates in the `templates/` directory.

5.  **Inspect `templates/deployment.yaml` and `templates/service.yaml`:**
    Notice how the values from `values.yaml` are referenced using Go template syntax (e.g., `{{ .Values.replicaCount }}`). Helm processes these templates to generate final Kubernetes manifests.

6.  **Lint your Chart:**
    Before deploying or packaging, it's good practice to lint your Chart to check for potential errors or best practices violations.
    
		helm lint my-app/
    
    You should see `0 charts linted, 0 warnings or errors found`.

7.  **Package your Chart (Optional):**
    If you want to distribute your Chart as a `.tgz` file, you can package it.
    
		helm package my-app/
    
    This will create a file like `my-app-0.1.0.tgz` in your current directory.

8.  **Install your Chart (Optional):**
    You can now install your locally created Chart on your Kubernetes cluster.
    
		helm install my-app-release my-app/
    
    Replace `my-app-release` with your desired release name.
    Verify the deployment with `kubectl get all -l app.kubernetes.io/instance=my-app-release`.

9.  **Uninstall your Chart (Optional):**
    
		helm uninstall my-app-release
    

### Next Steps

* Modify the `templates/` files to define your actual application's Kubernetes resources.
* Add more configuration options to `values.yaml`.
* Explore more advanced Helm features like subcharts, hooks, and testing.