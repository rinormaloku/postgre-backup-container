# Container to create PostgreSQL Backups
Minimalisitic container (only 25MB) for backing up PostgreSQL databases. 

## Goal

Easily backup your PostgreSQL Database. 

Intended to be used with: 
1. Kubernetes for creating CronJobs that periodically back up your database.
2. Container Instances (e.g Azure Container Instances, AWS Fargate) that can be scheduled at specified times.
3. Your computer! It's smaller than pgAdmin.  

## Running the Backup CronJob in Azure Kubernetes Service (AKS)
### Step 1. Create a storage account 
It has to be in the same Resource Group as the Kubernetes Cluster(the cluster resources not the resource group where the  Kubernetes Managed Service is located).

Name the storage account uniquely. And update [pg-storage-class.yaml](./aks/pg-storage-class.yaml) to use the unique name instead of "pgbackupstorage"


### Step 2. Replace your Database creds.
Replace database creds in [pg-backup-cronJob.yaml](./aks/pg-backup-cronJob.yaml). !Attention: This is for simplicity these should be replaced with Secrets.

### Step 3. Create the resources
Execute below command:

` kubectl create -f ./aks`

## Running manually on your computer
### Step 1. Pull the image
` docker pull rinormaloku/postgres-back-up `


### Step 2. Run and map to your drive (e.g. /d/backup)
` docker run -v /host/backup:/pg_backup rinormaloku/postgres-back-up `

## Contributing and Modifying

1. Make your desired changes and build the container:

` docker build -t $DOCKER_USER/postgres-back-up . `

2. Test it locally by executing the command below:

` docker run -v /d/backup:/pg_backup $DOCKER_USER/postgres-back-up `

3. Verify that it is an improvement and commit your changes ;)
