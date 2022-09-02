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
- _integration_
  - _specs_
- _page-objects_

### Pre-configure

**Add into /etc/hosts**
`127.0.0.1 storage`

### Main comparison features of paid version and Community

| Cypress-dashboard                                                       | Sorry-cypress                                                           |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| _parallel execution_                                                    | _parallel execution_                                                    |
| _Logs, screenshots and videos_                                          | _Logs, screenshots and videos_                                          |
| _Integrações(Github, Slack, etc.)_                                      | _Self-hosted(maquina local ou em cloud)_                                |
| _load balancing_                                                        | _Integrações usando webhooks_                                           |
| _Grouping of executions (environment, operating system, browser, etc.)_ | _Installation Examples with Docker, Kubernetes, and AWS CloudFormation_ |

### References

<https://docs.sorry-cypress.dev/configuration/director-configuration/minio-configuration>
