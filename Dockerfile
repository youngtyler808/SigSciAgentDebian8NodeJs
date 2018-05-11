FROM debian
MAINTAINER Signal Sciences, Corp.

# initial setup
RUN apt-get update
RUN apt-get install -y apt-transport-https wget vim sed curl build-essential libssl-dev

# install node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh \
    && chmod +x ./nodesource_setup.sh && ./nodesource_setup.sh \
    && apt-get install -y nodejs \
    && curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh -o install_nvm.sh \
    && chmod +x ./install_nvm.sh && ./install_nvm.sh \
    && npm install express


# install Signal Sciences
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/debian/ jessie main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update && apt-get -y install sigsci-agent
RUN npm install https://dl.signalsciences.net/sigsci-module-nodejs/sigsci-module-nodejs_latest.tgz
COPY agent.conf /etc/sigsci/

# copy app.js
COPY app.js /

# configure 
EXPOSE 80


# copy start script
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

#ENTRYPOINT ["/root/start.sh"]
