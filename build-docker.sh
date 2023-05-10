echo Here we call docker build, the only thing provided to this command is a path.
echo This path represents the context docker will use when building the container.
echo Docker cannot access things outside of the context when performing a build.
echo By default this will look for a file named 'Dockerfile' in the root of the context
read -p "Press enter to run the command"
(set -x; docker build .)
read -p "Press enter to contine"
echo If a file named 'Dockerfile' is not found the command will fail
read -p "Press enter to run the command"
(set -x; docker build arg-example)
read -p "Press enter to contine"
echo What if we have a repository or directory with multiple Dockerfiles?
echo Or what if we want the Dockerfile to have a different name?
echo This is where the following flag comes in: -f for SPECIFY A DOCKERFILE
echo Dockerfiles specified with this flag do not have to be inside the context and a full path must be provided
read -p "Press enter to run the command"
(set -x ; docker build -f arg-example/Dockerfile-args arg-example)
read -p "Press enter to contine"
echo If you look closely at the commands were running you can see that a hash is being spit out after each build
echo This is how you can refer to the docker container later on when you want to run it
echo But what if we want the image to have an intelligble name?
echo The flag seen here is -t for TAG AN IMAGE
echo This tells docker what to name the image built from this dockerfile
echo An image name contains two components, a name and a tag
echo If no tag is provided "latest" will be used
read -p "Press enter to run the command"
(set -x ; docker build -t docker-with-args -f arg-example/Dockerfile-args arg-example)
read -p "Press enter to contine"

echo This comprises 99% of my day to day use of docker build
