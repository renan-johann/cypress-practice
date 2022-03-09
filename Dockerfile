#Base image taken from:https://github.com/cypress-io/cypress-docker-images
FROM cypress/base:10 as cypressBuild

ARG FIREFOX_VERSION=89.0.2
ARG CHROME_VERSION=91.0.4472.114

#Create the folder where our project will be stored
RUN mkdir /my-cypress-project && apt update && \
    # install Chinese fonts
    # this list was copied from https://github.com/jim3ma/docker-leanote
    apt install --no-install-recommends -y fonts-arphic-bkai00mp \
    fonts-arphic-bsmi00lp \
    fonts-arphic-gbsn00lp \
    fonts-arphic-gkai00mp \
    fonts-arphic-ukai \
    fonts-arphic-uming \
    ttf-wqy-zenhei \
    ttf-wqy-microhei \
    xfonts-wqy \
    fonts-liberation libappindicator3-1 xdg-utils mplayer zip libcurl4 ca-certificates

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
ENV CI=1 \
    # disable shared memory X11 affecting Cypress v4 and Chrome
    # https://github.com/cypress-io/cypress-docker-images/issues/270
    QT_X11_NO_MITSHM=1 \
    _X11_NO_MITSHM=1 \
    _MITSHM=0

RUN npm i -g typescript && npm ci &&   \
    #npm install -g yarn@latest --force && \
    # install chrome
    wget -nv -O /usr/src/google-chrome-stable_current_amd64.deb "http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}-1_amd64.deb" && \
    dpkg -i /usr/src/google-chrome-stable_current_amd64.deb && \
    rm -f /usr/src/google-chrome-stable_current_amd64.deb && google-chrome --version && \
    # install firefox
    wget -nv -O /tmp/firefox.tar.bz2 http://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
    && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
    && rm /tmp/firefox.tar.bz2 \
    && ln -fs /opt/firefox/firefox /usr/bin/firefox && \
    npx cypress verify
# to avoid Docker thinking it is the same command and skipping tests
# have a dummy command here
# see discussion in https://github.com/moby/moby/issues/1996
# find variable that changes. For example on Zeit.co Now GitHub deploys the HOSTNAME changes
# RUN env
ARG HOSTNAME=1