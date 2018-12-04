FROM kartoza/postgis:10.0-2.4


RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y lbzip2\
	libgrib-api-tools\
	gdal-bin\
	sudo\
	postgis\
	curl\
	python-gdal\
	libopenjp2-7-dev\
	cmake\
	gfortran\
	python-dev

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

RUN apt-get update -y  && apt-get install -y nodejs 
RUN apt-get install -y --no-install-recommends yarn

RUN npm install -g pm2

RUN export EDITOR=nano

EXPOSE $PORT

#ADD bin /usr/bin
