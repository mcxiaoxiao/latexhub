# latexhub

Overleaf deployment for kubernetes environment. 

This deployment has been tested for a microk8s cluster with LocalPVs. 

## Deployment

### Requirements:

- [MicroK8s](https://microk8s.io)(default)/K8s cluster 
- [Helm](https://helm.sh)
- [Kompose](https://kompose.io)

### Build the Docker image (optional)

A version of the modified [Overleaf](https://github.com/overleaf/overleaf) image that is required for this deployment
has been uploaded to [Docker Hub](https://hub.docker.com/r/abompotas/overleaf).
However, you can build you own image using the Dockerfile in the [overleaf directory](/overleaf). 
In this case, don't forget to push the new image to a registry edit the 
[overleaf-deployment.yaml](/deployment/overleaf/overleaf-deployment.yaml) to point the correct image.
If you are looking to switch from using local Persistent Volumes (LocalPVs) to NFS (Network File System) for permanent storage, please refer to [k8s-overleaf](https://github.com/abompotas/k8s-overleaf)

Example:
```
# Build and tag the image
docker build -t abompotas/k8s-overleaf:5 ./deployment
# Push the image to Docker Hub
docker push abompotas/k8s-overleaf:5
```

### Deploy the application

Simply run the [deploy.sh](/deployment/deploy.sh) script. 

Example:
```
cd deployment
./deploy.sh
```

### Install LaTeX packages (Optional)

Overleaf's default installation is missing some of the most common packages. These can installed by modifying the 
post-installation scripts of the sharelatex image or by executing commands directly inside the container.

Example:
```
tlmgr install collection-latexrecommended
tlmgr install collection-fontsrecommended
tlmgr install collection-latexextra
tlmgr install collection-algorithms
tlmgr install collection-algorithmicx
```


### Other tips
The current PersistentVolumeClaims (PVCs) are designed with the assumption that the machine has at least 20GB of space available. If you need to scale up or down to fit your machine's capacity, you can adjust the storage sizes by modifying the following files:

- `deployment/mongo/values.yaml` at line 1207
- `deployment/redis/values.yaml` at line 511
- `deployment/overleaf/overleaf-pvc.yaml` at line 12

After adjusting the PVC sizes, you must also modify the PersistentVolumes (PVs) in `deployment/overleaf/overleaf-pv.yaml` to ensure compatibility and smooth operation of the application.

This project aims to provide an out-of-the-box solution, allowing you to quickly deploy a fully functional K8S-Based Overleaf. We have successfully deployed using current image and MicroK8s v1.31.2 + ubuntu20.04!
