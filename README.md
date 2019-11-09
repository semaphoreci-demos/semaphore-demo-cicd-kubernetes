A Companion Demo for the CI/CD with Docker and Kubernetes Book

## Local

### Build

    npm install
    cp env-sample .env

Set your database credentials in .env

Start test postgres and create database objects:

    . ./.env
    npm run migrate

### Tests

    npm run test
    npm run lint

### Start Locally (needs a db)

    npm run start

or with nodemon

    npm run start:dev

### Start Locally With Docker

    docker-compose up --build

### Use the API Locally

    curl -w "\n" -X PUT -d "firstName=al&lastName=pacino" 127.0.0.1:3000/person
    curl -w "\n" 127.0.0.1:3000/all

## DigitalOcean

Provision Services:
 - postgres cluster: create a database `addressbook_db` and a user `addressbook_user`
 - kubernetes cluster: set the cluster name `addressbook-server`

### Create secrets

For every platform

- db-params
    - DB_USER
    - DB_PASSWORD
    - DB_HOST

For Google Cloud

- gcp-key
    - <json file>:/home/semaphore/gcp-key.json

For DigitalOcean

- dockerhub
  - DOCKER_USERNAME=YOUR_USERNAME
  - DOCKER_PASSWORD=YOUR_PASSWORD

- do-access-token
  - DO_ACCESS_TOKEN=YOUR_DIGITALOCEAN_TOKEN



LICENS
