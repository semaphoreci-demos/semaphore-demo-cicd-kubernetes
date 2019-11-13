A Companion Demo for the CI/CD with Docker and Kubernetes Book

## Run it in your workstation

```bash
$ docker-compose up --build
$ curl -w "\n" -X PUT -d "firstName=al&lastName=pacino" 127.0.0.1:3000/person
$ curl -w "\n" 127.0.0.1:3000/all
```


## CI/CD Pipelines

The CI/CD workflow is as follows:

1. Build docker image w/cache.
2. Run tests inside docker images.
3. Push image to docker registry.
4. Perform canary deployment.
5. Run functional test and migration in canary deployment.
6. One-click production/stable deployment.

![Workflow](./screenshots/workflow.png)


### Configure Semaphore

1. Fork this repository
2. Clone it to your machine
3. Sign up for Semaphore and install [sem cli](https://docs.semaphoreci.com/article/53-sem-reference).
4. Add the project to Semaphore:

```bash
$ sem init
```

### Deploy to the cloud

Cloud services required:

- Kubernetes Cluster (recommended 3 nodes) called `semaphore-demo-cicd-kubernetes`
- PostgreSQL Database

Open the relevant pipeline files at `.semaphore` and fill in the environment variables for the blocks. 
Uncomment the desired promotion on `.semaphore/semaphore.yml`.

### Create Secrets

Create DB connection secret:

```bash
    $ sem create secret db-params \e
        -e DB_USER=YOUR_DB_USERNAME \
        -e DB_PASSWORD=YOUR_DB_PASSWORD \
        -e DB_HOST=YOUR_DB_IP \
        -e DB_PORT=YOUR_DB_PORT (5432) \
        -e DB_SCHEMA=YOUR_DB_SCHEMA (postgres) \
        -e DB_SSL=true|false (empty)
```


Depending on the cloud provider, you’ll need to create different secrets.

#### AWS

- Create an IAM User with Administrator permissions. Create a secret with the access id and the Kubernetes kubeconfig file:

```bash
$ sem create secret aws-key \
    -e AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_ID \
    -e AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_KEY \
    -f YOUR_KUBECONFIG.yml:/home/semaphore/aws-key.yml
```

#### Google Cloud

- Create service account and generate a key file. Upload the file to Semaphore:

```bash
$ sem create secret gcp-key -f YOUR_KEY_FILE.json:/home/semaphore/gcp-key.json
```

#### DigitalOcean

- Get your authentication API Token and create a secret for it:

```bash
$ sem create secret do-key -e DO_ACCESS_TOKEN=YOUR_DIGITALOCEAN_TOKEN
```

- Set the parameter in `db-params` secret to `DB_SSL=true`

- Create a secret to store your DockerHub credentials:

```bash
$ sem create secret dockerhub \
    -e DOCKER_USERNAME=YOUR_DOCKERHUB_USER \
    -e DOCKRE_PASSWORD=YOUR_DOCKERHUB_PASSWORD
```

## License

Copyright (c) 2019 Rendered Text

Distributed under the MIT License. See the file [LICENSE.md](./LICENSE.md).
