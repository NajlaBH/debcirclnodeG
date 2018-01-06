############################################################ 
# Dockerfile based on Debian _ stretch _ Image (NajlaBH-2018)
############################################################ 

# Set the base image to use to Debian(Stretch version)
#FOR ANGULAR APP


FROM debian:latest


# MAINTAINER
MAINTAINER "Najla BEN HASSSINE" <bhndevtools@gmail.com>


#UPDATE DEBIAN
RUN apt-get -y update
RUN apt-get -y upgrade


#INSTALL DEBIAN TOOLS
RUN apt-get install -y sudo curl git wget tree make apt-utils vim libssl-dev gnupg gnupg2 gnupg1 
RUN apt-get install -y software-properties-common build-essential libssl-dev


RUN sudo apt-get -y update
RUN sudo apt-get -y upgrade
RUN sudo apt-get -y update


RUN sudo apt-get install -y lsb-release
RUN sudo apt-get install -y pacman nodejs
RUN sudo apt-get install -y python3-pip virtualenv



#INSTALL NODE
RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -
RUN sudo apt-get install -y nodejs


# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 9.3.0

#INSTALL NVM
WORKDIR /usr/local/nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash


RUN sudo apt-get -y update
RUN sudo apt-get -y upgrade
RUN sudo apt-get -y update


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


RUN apt-get  -y update
RUN apt-get  -y upgrade
RUN apt-get  -y update


#INSTALL ANGULAR
RUN sudo chmod -R 777 /usr/lib/node_modules/

#ADD package.json /usr/local/nvm/package.json
RUN npm install

#RUN npm install npm@latest -g
#RUN npm install -g @angular/cli


#CLEAN ALL 
RUN apt-get -y autoclean
RUN npm install && \
	npm cache verify


# replace this with your application's default port
EXPOSE 8888
EXPOSE 4200
EXPOSE 3000


# confirm installation
#RUN node -v
#RUN nvm -v
#RUN npm -v


# add node and npm to path so the commands are available
RUN mkdir -p /home/najlabioinfo/app 
ENV HOME=/home/najlabioinfo/app 
WORKDIR $HOME
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

#_____ SET DEFAULT BEHAVIOUR _____
WORKDIR /home/najlabioinfo/
CMD ["bash"]