FROM rastasheep/ubuntu-sshd
MAINTAINER tchiboor

# Update
RUN apt-get update

# Create user
RUN useradd -m user -s /bin/bash
RUN echo "user:userpass" | chpasswd

RUN mkdir /challenge
RUN echo "{\"flag\":\"picoCTF{yey_this_is_the_flag}\"}" > /challenge/metadata.json

RUN echo "The flag is in an unusual place, FIND it!" > /home/user/not_the_flag.txt
RUN find / > /var/log/.flag.txt
RUN echo "picoCTF{yey_this_is_the_flag}" >> /var/log/.flag.txt
RUN find / >> /var/log/.flag.txt

# Working directory
WORKDIR /home/user

EXPOSE 22
# PUBLISH 22 AS ssh
