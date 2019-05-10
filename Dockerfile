FROM jenkins/jenkins:lts

# will be jenkins
RUN whoami

# install jenkins plugins
RUN /usr/local/bin/install-plugins.sh nodejs blueocean matrix-auth role-strategy embeddable-build-status cobertura

# switch to root user
USER root

# will be root
RUN whoami

# update
RUN apt-get update -y

# install required packages for puppeteer
# https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix
RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

# install gnu compiler collection (needed to build nodejs from source)
# not sure if this is really needed
# RUN apt-get install -y libstdc++

# to run puppeteer on node 8
# RUN apt-get install -y libnss3