## CLUSTER
```bash
cd Cluster
```
Create node image with nfs support
```bash
./buildImage.sh
``` 
Create the cluster with the new image
```bash
./create_cluster.sh
```
## ENVIRONMENT
```bash
cd ../Environment
```
Run the script which cares of executing all the yaml files distributed in this folder
```bash
./prepareEnv
```
At the end of the script execution the main addresses are displayed