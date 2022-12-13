### Goals:

- [ x ] Create functional web testing
- [ x ] Implement tests with typescript and cypress
- [ X ] Create Dockerfile with cypress image
- [ x ] Create docker-compose contains images like [minio, mongo, sorry-cypress-api, sorry-cypress-director, sorry-cypress-dashboard]
- [ X ] Generate dashboard with sorry-cypress
- [ X ] Create incoming webhook for Slack
- [ ] Add vault
- [ ] Create automatic Slack notification with Jenkins pipeline
- [ ] Create CI with Github Actions
- [ ] Implement functional API testing

### Below the project structure

**Cypress-practice**

- _cypress_
  - _page-objects_
  - _e2e_
    - _specs_

### Pre-configure

**Add into /etc/hosts**
`127.0.0.1 storage`

### Config to Run scripts

**Docker:**

Run `docker compose up`
Acessar o sorry-cypress-dashboard: <http://localhost/80>

**Jenkins:**
open a browser on <http://localhost:8080>

### Start-server-and-test module

If the server takes a very long time to start, we recommend trying the [start-server-and-test](https://github.com/bahmutov/start-server-and-test) module.


### Running sorry-cypress kit

We are going to run the full sorry-cypress kit:
1. **director** service will use MongoDB to store the test runs and the results
2. **API** service (a GraphQL interface to MongoDB) to let us issue queries and retrieve tests results
3. **Dashboard** service - a web dashboard for browsing the results
4. **minio** will let us store files - videos and screenshots generated by cypress agent

### After successfully running docker-compose, we have:

**Director** service on <http://localhost:1234>
**API** service on <http://localhost:4000>
**Dashboard** running on <http://localhost:8080>

### References links:
<https://docs.sorry-cypress.dev/configuration/director-configuration/minio-configuration>