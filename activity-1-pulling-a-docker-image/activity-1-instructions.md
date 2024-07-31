# Activity 1: Getting started with Docker

## Install Docker

Go here to [install Docker](https://www.docker.com/get-started), following the instructions for your particular operating system.

If you don't have a Docker account create an account when prompted, or [go here](https://hub.docker.com/).
After you install Docker, start up Docker desktop by double clicking on the app. It may take some time to start up.

## Pull an image

1. Open up your [command line](https://towardsdatascience.com/a-quick-guide-to-using-command-line-terminal-96815b97b955).

2. Open up the Docker Desktop app. Click on 'images' on the left. This shows the images you currently have available on your computer.

3. We need to get the Docker **image** we want to use. We do this by "pulling" it

```
docker pull cansav09/practice-image:1
```

4. To see what images we have we can run `docker image ls` and we should see `rocker/rstudio:4` show up now.

## Run a container

1. Now if want to launch the image for use, we can use `docker run` to turn it into a **container**

```
docker run cansav09/practice-image:1
```

2. To see what containers we have running we have we can run:

```
docker ps
```

3. To run stuff interactively from the command line we can do:

```
docker exec -it <PUT_CONTAINER_ID_HERE> bash
```

4. To run a script using the docker container we could just add reference to a script at the end:

**BUT! You will find that this command won't work yet though, why?**

```
docker exec -it <PUT_CONTAINER_ID_HERE> bash run_analysis.sh
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
docker run -v $PWD:/home cansav09/practice-image:1
```

Now we can run
```
docker exec -it 12f585b4029d bash /home/run_analysis.sh
```

## Running a port!


```
docker run -v $PWD:/home -p 8787:8787 cansav09/practice-image:1
```

Now in your internet browser, go to `localhost:8787`. You should see an RStudio login page.

Login to RStudio. Your username will be `rstudio` and your password, will be whatever you set your password to be.

Now you are ready to develop inside a Docker container!

### A breakdown what these Docker run options are

[Docker has super extensive documentation](https://docs.docker.com/)! But to get you started, here's the highlights for this `docker run` command:

- **The remove option (`--rm`)**	Automatically removes the container when docker run exits.
- **The volume option (`-v`)** is how you specify what files you’d like available in the container and where to find them. In this instance we are using the output of the pwd command (print working directory) so that wherever you run this command, the files in that directory will be available in the container. The part after the colon specifies where these files will be found in the container.
- **The environment option (`-e`)** is how you can specify any environment variables you will need. In this instance for the rocker image we need to specify a password. but for the python image we needed to specify `JUPYTER_ENABLE_LAB=yes` so that we can use Jupyter Lab.  
- **The port option (`-p`)** is how you specify what port you can connect to this on using your internet browser.
- **The image** to use is specified in the last part of the `docker run` command says what image to run, so in these instances, we are running a container using the `jhudsl/reproducible-r` or `jhudsl/reproducible-python` images.
