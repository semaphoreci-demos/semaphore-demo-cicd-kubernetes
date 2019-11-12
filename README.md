A Companion Demo for the CI/CD with Docker and Kubernetes Book

## Run it in your workstation

    $ docker-compose up --build
    $ curl -w "\n" -X PUT -d "firstName=al&lastName=pacino" 127.0.0.1:3000/person
    $ curl -w "\n" 127.0.0.1:3000/all

## Configure CI/CD

1. Fork this repository
2. Clone it to your machine
3. Sign up for Semaphore and install [sem cli](https://docs.semaphoreci.com/article/53-sem-reference).
4. Add the project to Semaphore:

    $ sem init

### Deploy to Cloud

Services required:

- Kubernetes Cluster (recommended 3 nodes) called `addressbook`
- PostgreSQL Database

Create DB connection secret:

    $ sem create secret db-params \e
        -e DB_USER=YOUR_DB_USERNAME \
        -e DB_PASSWORD=YOUR_DB_PASSWORD \
        -e DB_HOST=YOUR_DB_IP \
        -e DB_PORT=YOUR_DB_PORT (5432) \
        -e DB_SCHEMA=YOUR_DB_SCHEMA (postgres) \
        -e DB_SSL=true|false (empty)

### Google Cloud

Create service account and generate a key file. Upload the file to Semaphore:

    $ sem create secret gcp-key -f YOUR_KEY_FILE.json:/home/semaphore/gcp-key.json

For DigitalOcean

- dockerhub
  - DOCKER_USERNAME=YOUR_USERNAME
  - DOCKER_PASSWORD=YOUR_PASSWORD

- do-access-token
  - DO_ACCESS_TOKEN=YOUR_DIGITALOCEAN_TOKEN
