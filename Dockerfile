############################################################ 
# Dockerfile based on Debian _ stretch _ Image (NajlaBH-2017)
############################################################ 

# Set the base image to use to Debian(Stretch version)
# FO RNA_SEQ ANALYSIS
FROM debian:latest


# MAINTAINER
MAINTAINER "Najla BEN HASSSINE" <bhndevtools@gmail.com>


#UPDATE DEBIAN
RUN apt-get update
RUN apt-get upgrade


#INSTALL DEBIAN TOOLS
RUN apt-get install -y sudo curl wget tree make apt-utils vim libssl-dev gnupg gnupg2 gnupg1 git
RUN apt-get install -y software-properties-common build-essential libssl-dev

#INSTALL NODE
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
RUN sudo apt-get install -y nodejs


# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.4.7

#INSTALL NVM
WORKDIR /usr/local/nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash


RUN apt-get update

RUN export NVM_DIR="/usr/local/nvm"
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
RUN [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

RUN /bin/bash -c "source /root/.bashrc"
RUN /bin/bash -c "source ~/.profile"
RUN /bin/bash -c "source ~/.bashrc"
RUN /bin/bash -c "source /etc/bash.bashrc"

#INSTALL FIREFOX
RUN touch /etc/apt/sources.list
RUN apt-get install -y firefox-esr
#http://127.0.0.1:3000/


RUN apt-get update
RUN apt-get upgrade
RUN apt-get update


#INSTALL ANGULAR
RUN sudo chmod -R 775 /usr/lib/node_modules/
RUN npm install minimatch@3.0.2 --save-dev


# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH


#CLEAN ALL 
RUN apt-get -y autoclean
RUN npm cache verify
RUN npm install -g @angular/cli


#CLEAN ALL 
RUN apt-get -y autoclean


# replace this with your application's default port
EXPOSE 8888
EXPOSE 4200
EXPOSE 3000


# confirm installation
RUN node -v
RUN npm -v


RUN mkdir -p /home/najlabioinfo/app 
ENV HOME=/home/najlabioinfo/app 
WORKDIR $HOME

#_____ SET DEFAULT BEHAVIOUR _____
WORKDIR /home/najlabioinfo/
CMD ["bash"]