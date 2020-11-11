FROM arm32v7/debian:latest

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y wget
RUN apt-get install -y gnupg2

COPY raspi.list /etc/apt/sources.list.d/raspi.list
RUN wget https://archive.raspberrypi.org/debian/raspberrypi.gpg.key -O - | apt-key add -

RUN apt-get -y update

RUN apt-get install -y pigpio
RUN apt-get install -y python3-pip
RUN apt-get install -y python-pigpio
RUN apt-get install -y python3-pigpio
RUN apt-get install -y git

RUN pip3 install ephem
RUN pip3 install configparser
RUN pip3 install Flask
RUN pip3 install paho-mqtt
RUN pip3 install requests

RUN git clone http://github.com/bremor/Pi-Somfy.git

WORKDIR /Pi-Somfy

CMD /usr/bin/python3 /Pi-Somfy/operateShutters.py -c /Pi-Somfy/operateShutters.conf -a -m
