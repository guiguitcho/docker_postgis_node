FROM kartoza/postgis:10.0-2.4

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y lbzip2\
	libgrib-api-tools\
	gdal-bin\
	sudo\
	yarn\
	postgis\
	curl\
	python-gdal\
	nano

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

Run apt-get install -y nodejs

RUN export EDITOR=nano

# Permet une authentification avec password sans compte user
RUN sed -i 's/^.*local   all             all                                     peer.*$/local   all             all                                     md5/' /etc/postgresql/10/main/pg_hba.conf
RUN service postgresql force-reload

EXPOSE $PORT

#ADD bin /usr/bin
