FROM kartoza/postgis:12.0


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
	python-dev\
	nano\
	build-essential\
	apt-transport-https \
    	ca-certificates \
    	curl \
    	gnupg2 \
    	software-properties-common
	
#Installation de Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
   
RUN apt-get update -y  && apt-get install -y docker-ce docker-ce-cli containerd.io

#Installation de Nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -y  && apt-get install -y nodejs 

RUN npm install -g pm2

RUN export EDITOR=nano

EXPOSE $PORT

#ADD bin /usr/bin
