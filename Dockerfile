FROM cypress/included:12.0.2

WORKDIR /cypress-project

COPY ./package.json .
COPY ./package-lock.json .
COPY ./cypress.config.js .
COPY ./cypress ./cypress


ENV CI=true
RUN npm ci && \
    npx cypress verify

ENTRYPOINT [ "npx", "cypress", "run" ]