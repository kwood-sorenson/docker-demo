echo Running docker can be a bit bewildering, but it isnt as bad as you think.
echo lets start by running the a simple container from the dockerfile in this directory
read -p "Press enter to run the command"
(set -x ; docker build -t simple-container .)
(set -x ; docker run --rm simple-container)
read -p "Press enter to contine"
echo this example container has a simple command that just calls python and prints hello world
echo but what if we need to pass something into the container?
echo unless youre running a service you need to be able to pass data into the container
echo this next container takes a command line argument and passes it to the script inside
read -p "Press enter to run the build"
(set -x ; docker build -t docker-with-args -f arg-example/Dockerfile-args arg-example)
read -p "first we'll run it with the default container args"
(set -x ; docker run --rm docker-with-args)
read -p "then we'll run it with an arg of our own"
(set -x ; docker run --rm docker-with-args /bin)
read -p "Press enter to contine"
echo We can also use environment variables
echo this next container takes looks for an environment variable when starting and complains when it isnt present
read -p "Press enter to run the build"
(set -x ; docker build -t docker-with-env -f env-example/Dockerfile-env env-example)
read -p "first we'll run it without providing a value"
(set -x ; docker run docker-with-env)
read -p "first we'll run it with one value"
(set -x ; docker run -e DEMO_VAR=. docker-with-env)
read -p "Press enter to contine"
echo thats all fine and good, but were still only operating on files already present within the container
echo this is where volumes come in
echo lets use our script on a mounted volume in the next examples
echo volumes are in the form of -v path:path
echo with the first path being the path outside the container you want to mount
echo and the second path being the path where you want that directory accessible in the container
read -p "we can provide the path to the container as an arg"
(set -x ; docker run -v /home/:/mydir --rm docker-with-args /mydir)
read -p "or as an env var"
(set -x ; docker run -v /home/:/mydir -e DEMO_VAR=/mydir docker-with-env)
read -p "Press enter to contine"
echo "all of the examples so far haven't needed to interact with the network"
echo "docker containers are isolated from the host machine by default"
echo "we can use the port flag to let a port on the host machine communicate with the container"
echo "the syntax of the port flag is -p <host port>:<container port>"
echo "the service-example docker container runs a simple flask server on port 5000 in its container"
echo "here we map our host's port 5000 to the container's port 5000"
read -p "Press enter to contine"
(set -x ; docker build -t docker-webservice -f service-example/Dockerfile-service service-example)
(set -x ; docker run -p 5000:5000 --name service-example docker-webservice &)
echo "we can run 'curl localhost:5000' to send a GET request to the webservice"
read -p "Press enter to contine"
(set -x ; curl localhost:5000)
read -p "Press enter to contine"
echo "or give it some data on a POST request"
read -p "Press enter to contine"
(set -x ; curl localhost:5000 --data "data=Hello world")
read -p "Press enter to contine"
(set -x ; docker kill service-example)