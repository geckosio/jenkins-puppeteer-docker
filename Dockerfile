FROM jenkinsci/blueocean

# will be jenkins
RUN whoami

# install jenkins plugins
RUN /bin/sh -c install-plugins.sh matrix-auth role-strategy embeddable-build-status cobertura

# switch to root user
USER root

# will be root
RUN whoami