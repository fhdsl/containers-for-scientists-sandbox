# Activity 2: Build a Docker image

A Dockerfile is a recipe for how to build a docker image. The best way to learn to write Dockerfiles is to start off with one that is already written and modify it for your needs.

Open up the Dockerfile in this folder!

You'll notice we have this at the top for you:
```
FROM cansav09/practice-image:1
```

This means we're going to take the existing image called, `cansav09/practice-image:1` and build on to it.
This image will be our base. There are so many Docker images out there, that it might be that someone has already created a docker image with most of the functionality you need for your project.

### Build a Docker image from a Dockerfile

Now in your Command Prompt or Terminal navigate to this folder and run the following:

```
docker build . -t cool-new-image
```

Optionally you could call this from somewhere else and use the `-f` option to specify the file path to the Dockerfile. But in the scenario above it just grabs the Dockerfile in our working directory.

Navigate back to your Docker desktop and the `images` window. If your image built successfully, you should see a new image in your list!

Let's try running that image

```
docker run cool-new-image
```

We should have a message: `Yay! I built a Docker image` pop up upon building the image. Not super useful but we can see how we've edited the original image

### Add a package to the Dockerfile

For anything we need ran in this image we are building we need to use the `RUN` command followed by the installation steps we'd need.

- **Copy and paste** this into your Dockerfile so we can add the `rmarkdown` package.
- **AND remove the `CMD` line**

```
RUN Rscript -e  "options(warn = 2);install.packages('rmarkdown', \
    repos = 'https://cloud.r-project.org/')"
```

Save your edited Dockerfile.

Now re-run `docker build` as you did in the previous section. This time we'll add a versioning tag using `:` in the `-t` option

```
docker build . -t cool-new-image:2
```

If all built successfully, you should see a message like:
```
=> exporting to image                                                     0.0s
=> => exporting layers                                                    0.0s
=> => writing image sha256:ayuahgfuiseohfauwheufhauwihefuahweufhawfbuibe  0.0s
=> => naming to docker.io/library/cool-new-image:2
```

**End of official activity**

## Essential Docker commands:

`FROM` is one of the [main commands that a Dockerfile can take as described by their documentation](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/).

Now you are also familiar with `CMD` which runs something when the container is built

> **FROM** creates a layer from the another Docker image.
> **CMD** specifies what command to run within the container.
> **RUN** builds your application with make.
> **COPY** adds files from your Docker client’s current directory.

Next let's use `RUN` to add a package to our image.

### Bonus guide: Adding other kinds of packages!

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

To add a **Python package using pip**, you will need to add pip3 to install Python packages using this format. But first you'll need to make sure you have pip installed using:

Install pip:
```
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip
```

Then you can use pip install to install packages
```  
RUN pip3 install \
    "somepackage==0.1.0"
```

There are so many things you can add to your Docker image. (Picture whatever software and packages you are using on your computer). We can only get you started for the feel of how to build a Dockerfile, and what you put on your Docker image will be up to you.

To figure out how to add something, a good strategy is to look for other Dockerfiles that might have the package you want installed and borrow their `RUN` command. Then try to re-build your Docker image with that added `RUN` command and see if it builds successfully.

And lastly, make sure that whatever changes you make to your Dockerfile, that you add it to your GitHub repository!
