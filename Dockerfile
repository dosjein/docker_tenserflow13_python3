FROM tensorflow/tensorflow:1.3.0-py3
MAINTAINER Ronalds Sovas <sovas@dosje.in>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales screen wget sudo

ADD start.sh /start.sh

RUN chmod 755 /start.sh 

ADD alias.txt /.alias

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    pip3 install flask && \
    pip3 install flask_restful && \
    pip3 install flask_jsonpify && \
    mkdir /opt/classificator


ENV LANG en_US.UTF-8 


#Flesk Server
EXPOSE 5002 6006 8888

WORKDIR /opt/classificator

CMD ["/start.sh"]