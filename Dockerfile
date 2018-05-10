#version  0.0.1

FROM ubuntu:16.04

MAINTAINER Gaurav_Srivastava

#node_installation
RUN apt-get update && apt-get install curl build-essential gcc make -y
RUN apt-get install python-software-properties -y
RUN curl -O https://nodejs.org/dist/v6.9.2/node-v6.9.2.tar.gz
RUN tar xzf node-v6.9.2.tar.gz
RUN cd node-v6.9.2 && ls && ./configure && make && make install
RUN apt-get install git -y
RUN apt-get install redis-server -y
RUN apt-get install python2.7 -y
RUN apt-get install vim  -y
RUN mkdir /opt/app/
RUN mkdir /opt/build

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:superuserdo' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

#make ssh without password
WORKDIR /root
COPY start.sh /root
RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh
