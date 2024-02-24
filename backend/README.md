# Based on the following Microsoft Learn module

[https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-web](https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-web)

This code is part of the Microsoft Learn module of the AKS workshop. It provides the API for the ratings application. The API connects to a MongoDB to store and retrieve data.

## Contents

| File/folder       | Description                                |
|-------------------|--------------------------------------------|
| `routes`          | API endpoint implementation.               |
| `models`          | Representation of API data model.          |
| `data`            | Data to be preloaded into the database.    |
| `views`           | Handelbars HTML view templates.            |
| `server.js`       | NodeJS web server startup file.            |
| `app.js`          | Express NodeJS application startup file.   |
| `.gitignore`      | Define what to ignore at commit time.      |
| `.dockerignore`   | Define what to ignore at build time.       |
| `Dockerfile`      | Define how the Docker image is built.      |
| `README.md`       | This README file.                          |
| `LICENSE`         | The license for the sample.                |

## Prerequisites

To build this sample locally, you can either build using Docker, or using NPM.

- Install [Docker](https://www.docker.com/get-started)
- Install [NodeJS](https://nodejs.org/en/download/)

## Setup

- To build using Docker, in the project folder, run `docker build -t ratings-api .`
- To build using NPM, in the project folder, run `npm install`

## Running the sample

- To run using Docker, run `docker run -it -p 3000:3000 ratings-api`
- To run using NPM, run `npm start`

Required configuration via environment variables:

- MONGODB_URI: MongoDB connection is configured using an environment variable called `MONGODB_URI`. This URI should look like `mongodb://[username]:[password]@[endpoint]:27017/ratingsdb`

The API exposes port 3000.

You should then be able to access the API at <http://localhost:3000/api/items>
