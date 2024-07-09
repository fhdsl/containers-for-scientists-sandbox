# Activity 2: Build a Docker image

A Dockerfile is a recipe for how to build a docker image. The best way to learn to write Dockerfiles is to start off with one that is already written and modify it for your needs.

You can practice building a docker image by downloading the Dockerfiles we have started and changing it slightly.

### Build a Docker image from a Dockerfile

Build a docker image from this Dockerfile using the command below, but replace `image_name` with what you would like your modified image to be called.   

```
docker build -f Dockerfile . -t image_name
```

Navigate back to your Docker desktop and the `images` window. If your image built successfully, you should see a new image in your list!

### Modify a Docker image

If you want add or remove a package from a Docker image, you'll need to modify the Dockerfile.
Using your preferred text editor (or RStudio or Jupyter Lab), open up the Dockerfile.

You will see the first line in the Docker image is a `FROM` command. This is a command that will take another docker image to start from.
- For our **R example**, we are starting off with an image that already has R and the tidyverse. - For our **Python example** we are starting off with an image that already has Python and Jupyter Lab.

There are so many Docker images out there, that it might be that someone has already created a docker image with most of the functionality you need for your project.

`FROM` is one of the [main commands that a Dockerfile can take as described by their documentation](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/):

> **FROM** creates a layer from the another Docker image.
> **COPY** adds files from your Docker client’s current directory.
> **RUN** builds your application with make.
> **CMD** specifies what command to run within the container.

### Add to the Dockerfile

To get a feel for how these work, let's add a line to the your example Dockerfile.

Using your preferred text editor (or RStudio or Jupyter Lab), open up the Dockerfile and add this line at the **very end** of the file. Do not add this line to the start of the file as this will not work. The `FROM` command needs to come first.

```
CMD ["echo","Yay! I added to this Docker image"]
```

Now re-run `docker build` as you did in the previous section. (Use the command below but replace `image_name` with whatever your image is called).

```
docker build -f Dockerfile . -t image_name
```

If all built successfully, you should see a message like:
```
=> exporting to image                                                     0.0s
=> => exporting layers                                                    0.0s
=> => writing image sha256:ayuahgfuiseohfauwheufhauwihefuahweufhawfbuibe  0.0s
=> => naming to docker.io/library/image_name
```

Now to run the image we can use the docker run command we used in the previous chapter (see below) and we should have a message: `Yay! I added to this Docker image` pop up upon building.

<details> <summary> To run your new **Python docker image** </summary>
But replace `image_name` with whatever you have called your image.
```
docker run --rm -v $PWD:/home/jovyan/work -e JUPYTER_ENABLE_LAB=yes -p 8787:8787 image_name
```
</details>

<details> <summary> To run the **R docker image** </summary>
But replace `image_name` with whatever you have called your image.
```
docker run --rm -v $PWD:/home/rstudio -e PASSWORD=password -p 8787:8787 image_name
```
</details>

**Stop and remove these containers before moving on.** You can do this by going to Docker desktop and clicking on the trash can button next to each container. For images click `Clean up` to check off the images you'd like to remove and then hit `Remove`.

### Add another package!

Starting off with your example Dockerfile, we will practice adding another package and re-build the docker image with a new package.

**Note** that spacing is important as well as having a `\` at the end of each line if the command is continuing.

To add R packages from CRAN, you can use this kind of format:
```
RUN Rscript -e  "install.packages( \
    c('BiocManager', \
      'R.utils', \
      'newpackagename'))"
```

To add an R package from Bioconductor, you can follow this kind of format:

```
RUN Rscript -e "options(warn = 2); BiocManager::install( \
  c('limma', \
    'newpackagename')

```

To add a **Python package using pip**, you will need to add pip3 to install Python packages using this format:
```  
RUN pip3 install \
    "somepackage==0.1.0"
```

There are so many things you can add to your Docker image. (Picture whatever software and packages you are using on your computer). We can only get you started for the feel of how to build a Dockerfile, and what you put on your Docker image will be up to you.

To figure out how to add something, a good strategy is to look for other Dockerfiles that might have the package you want installed and borrow their `RUN` command. Then try to re-build your Docker image with that added `RUN` command and see if it builds successfully.

And lastly, make sure that whatever changes you make to your Dockerfile, that you add it to your GitHub repository!

### More about Docker next steps

- [Dockerfile Tutorial by Example](https://takacsmark.com/dockerfile-tutorial-by-example-dockerfile-best-practices-2018/#lets-create-your-first-image).
- [Dockerfile examples](https://linuxtechlab.com/learn-create-dockerfile-example/)

### A list of handy Docker commands:

_Get info on current containers:_  
```
docker ps
```

_How to stop an individual container:_  
```
docker container ls
docker stop <containerID>
```

_Get rid of all non-running containers:_  
```
docker container prune
```

_Stop all containers:_  
```
docker stop $(docker ps -a -q)
```

_Remove all containers:_  
```
docker rm -f $(docker ps -a -q)
```
