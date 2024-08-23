# Activity 1: Getting started with Podman

## Install Podman

Go here to [install Docker](https://podman.io/docs/installation), following the instructions for your particular operating system.

## Pull an image

1. Open up your [command line](https://towardsdatascience.com/a-quick-guide-to-using-command-line-terminal-96815b97b955).

2. Start up Podman by running the following:

```
podman machine init
podman machine start
```

3. We need to get the Docker **image** we want to use. We do this by "pulling" it.

Run this command in your Terminal or Command Prompt window:

```
podman pull cansav09/practice-image:1
```

4. To see what images we have we can run `docker image ls` and we should see `rocker/rstudio:4` show up now.

## Run a container

1. Now if want to launch the image for use, we can use `podman run` to turn it into a **container**

```
podman run cansav09/practice-image:1
```

2. To see what containers we have running we have we can run:

```
podman ps
```

3. To run stuff interactively from the command line we can do:

```
podman exec -it <PUT_CONTAINER_ID_HERE> bash
```

4. To run a script using the docker container we could just add reference to a script at the end:

**BUT! You will find that this command won't work yet though, why?**

```
podman exec -it <PUT_CONTAINER_ID_HERE> bash run_analysis.sh
```

This won't work because the file `run_analysis.sh` is not a file that our container has. Docker containers do not have all the files that our computer does; they only have the files we add to it.

```
bash: run_analysis.sh: No such file or directory
```

## Getting files on your container

If we want to run `run_analysis.sh` there's two ways we could get our files on there.

- We could download the files we need from online!

We could `git clone` files from a repository or otherwise `wget` or `curl` files.

- We could add a `volume` of files that are local to our computer. For this we will use the You'll `-v` or volume option.

We can specify a particular file path on our computer or give it `$PWD` Then optionally we can give a `:` and a file path we'd like this to be stored on on the container. Otherwise it will be stored at the absolute top of the container.

```
podman run -v $PWD:/home cansav09/practice-image:1
```

Now we can run
```
podman exec -it <REPLACE_WITH_CONTAINER_ID> bash /home/run_analysis.sh
```
