# nodejs-web-app

1. install latest version of node LTE,
2. install npm 
3. Run the node

#Dockerfile 
1. make nodejs docker continer 
run the command " docker build -t <node:6.9.2>  . "


#docker-compose
If you want to run your node application server more than one so you can use of docker-compose.yml file, Follow steps
1. make sure whatever in scripts like volume, network and docker image etc, are these things okay or not and docker-compose utility are installed or not in your system.
2. if not creaet network by   " docker create network nodenet " and make volume directory to bind with host to docker container.
3. Run the docker-compose.yml script. by " docker-compose up -d  or docker-compose -f docker-compose.yml up -d "

And if you want to run this script at anyother location so you can copy the docker-compsoe.yml script file and run as follow abobe steps.
