<<<<<<< HEAD
FROM resin/rpi-raspbian
ENV LANG C.UTF-8


#TODO Enable IC2 interface
WORKDIR /data
RUN apk add --no-cache python-rpi.gpio
RUN apk add --no-cache git python-dev python-serial python-smbus python-jinja2 python-xmltodict python-psutil python-pip
RUN pip install xmltodict
RUN cd ~
RUN git clone https://github.com/modmypi/PiModules.git
RUN cd ~/PiModules/code/python/upspico/picofssd
RUN python setup.py install
RUN update-rc.d picofssd defaults
RUN update-rc.d picofssd enable
RUN apk add --no-cache i2c-tools

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
=======
FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8

#install UPSPico Dependencies

# Copy data for add-on
COPY src/* /home/pi/
COPY src/rc.local /etc/
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
>>>>>>> e23cfdaa0a07c39eb34d92217bebb255aaf55205
