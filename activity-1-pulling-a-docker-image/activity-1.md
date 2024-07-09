# Activity 1: Getting started with Docker

## Install Docker

Go here to [install Docker](https://www.docker.com/get-started), following the instructions for your particular operating system.

If you don't have a Docker account create an account when prompted, or [go here](https://hub.docker.com/).
After you install Docker, start up Docker desktop by double clicking on the app. It may take some time to start up.

## Getting started with Docker

1. Open up your [command line](https://towardsdatascience.com/a-quick-guide-to-using-command-line-terminal-96815b97b955).

2. First we need to get the Docker **image**. We do this by "pulling" it

```
docker pull rocker/tidyverse
```



3. Open up the Docker Desktop app. Click on 'images' on the left. This shows the images you currently have available on your computer.

4. Return to your command line. Using [`cd`](https://www.geeksforgeeks.org/cd-command-in-linux-with-examples/) and [`ls`](https://linuxize.com/post/how-to-list-files-in-linux-using-the-ls-command/) navigate to your project repository (or whatever files you'd like to be accessible in your development environment) and we can start up a docker container using `docker run`.


<details> <summary> To run the **Python docker image** </summary>
```
docker run --rm -v $PWD:/home/jovyan/work -e JUPYTER_ENABLE_LAB=yes -p 8787:8787 jhudsl/reproducible-python
```
Now in your internet browser, go to the address printed out. It should take you to Jupyter Lab.
Now you are ready to develop inside a Docker container!

</details>

<details> <summary> To run the **R docker image** </summary>
But you can change the `password` to whatever you'd like.
```
docker run --rm -v $PWD:/home/rstudio -e PASSWORD=password -p 8787:8787 jhudsl/reproducible-r
```
Now in your internet browser, go to `localhost:8787`. You should see an RStudio login page.

Login to RStudio. Your username will be `rstudio` and your password, will be whatever you set your password to be.

Now you are ready to develop inside a Docker container!

</details>

To see what containers you have running or to clear out old containers, in Docker Desktop you can go to the `Containers/Apps` page.

```{r, fig.alt="If you navigate to the Containers/Apps page in Docker Desktop, you should see a container in the list. It will be named something randomly (in this case ‘zen_merkle’). From this page you can stop or remove old containers as well as navigate to their browser page. ", out.width = "100%", echo = FALSE}
ottrpal::include_slide("https://docs.google.com/presentation/d/1IJ_uFxJud7OdIAr6p8ZOzvYs-SGDqa7g4cUHtUld03I/edit#slide=id.gfc8849fa4d_0_10")
```

### A breakdown what these Docker run options are

[Docker has super extensive documentation](https://docs.docker.com/)! But to get you started, here's the highlights for this `docker run` command:

```{r, fig.alt="A breakdown of the docker run command. The remove option (`--rm`) automatically removes the container when docker run exits. Dash v, the volume option is how you specify what files you’d like available in the container and where to find them. In this instance we are using the output of the pwd command (print working directory) so that wherever you run this command, the files in that directory will be available in the container. The part after the colon specifies where these files will be found in the container. Dash e, the environment option is how you can specify any environment variables you will need. In this instance for the rocker image we need to specify a password. Dash p, the port option is how you specify What port you can connect to this on using your internet browser. The last part of the docker run command says what image to run, so in this instance, we are running a container using the jhudsl/reproducible-r image.", out.width = "100%", echo = FALSE}
ottrpal::include_slide("https://docs.google.com/presentation/d/1IJ_uFxJud7OdIAr6p8ZOzvYs-SGDqa7g4cUHtUld03I/edit#slide=id.gfbc11e6ab0_0_18")
```

- **The remove option (`--rm`)**	Automatically removes the container when docker run exits.
- **The volume option (`-v`)** is how you specify what files you’d like available in the container and where to find them. In this instance we are using the output of the pwd command (print working directory) so that wherever you run this command, the files in that directory will be available in the container. The part after the colon specifies where these files will be found in the container.
- **The environment option (`-e`)** is how you can specify any environment variables you will need. In this instance for the rocker image we need to specify a password. but for the python image we needed to specify `JUPYTER_ENABLE_LAB=yes` so that we can use Jupyter Lab.  
- **The port option (`-p`)** is how you specify what port you can connect to this on using your internet browser.
- **The image** to use is specified in the last part of the `docker run` command says what image to run, so in these instances, we are running a container using the `jhudsl/reproducible-r` or `jhudsl/reproducible-python` images.
