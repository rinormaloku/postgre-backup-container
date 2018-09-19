# Container to create PostgreSQL Backups
Minimalisitic container (only 25MB) for backing up Postgres databases. 

---

## Goal

Easily backup your PostgreSQL Database. 

Intended to be used with: 
1. Kubernetes for creating CronJobs that periodically back up your database.
2. Container Instances (e.g Azure Container Instances, AWS Fargate) that can be scheduled at specified times.
3. Your computer! It's smaller than pgAdmin.  


## Running manually on your computer
### Step 1. Pull the image
` docker pull rinormaloku/postgres-back-up `


### Step 2. Run and map to your drive (e.g. /d/backup)
` docker run -v /host/backup:/pg_backup rinormaloku/postgres-back-up `

---

## Contributing and Modifying

1. Make your desired changes and build the container:

` docker build -t $DOCKER_USER/postgres-back-up . `

2. Test it locally by executing the command below:

` docker run -v /d/backup:/pg_backup $DOCKER_USER/postgres-back-up `

3. Verify that it is an improvement and commit your changes ;)