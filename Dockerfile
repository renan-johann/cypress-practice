#Base image taken from:https://github.com/cypress-io/cypress-docker-images
FROM cypress/base:10 as cypressBuild

#Create the folder where our project will be stored
RUN mkdir /my-cypress-project
#We make it our workdirectory
WORKDIR /my-cypress-project

#Copy the essential files that we MUST use to run our scripts.
COPY ./package.json .
COPY package-lock.json .
COPY ./cypress.json .
COPY ./cypress ./cypress

# by setting CI environment variable we switch the Cypress install messages
# to small "started / finished" and avoid 1000s of lines of progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1
RUN npm ci

RUN npx cypress verify

# to avoid Docker thinking it is the same command and skipping tests
# have a dummy command here
# see discussion in https://github.com/moby/moby/issues/1996
# find variable that changes. For example on Zeit.co Now GitHub deploys the HOSTNAME changes
# RUN env
ARG HOSTNAME=1