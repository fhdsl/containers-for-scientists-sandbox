# Docker Workshop

This GitHub repository is sandbox of Docker to play with for the purposes of a workshop (or independent learning)

[See the slides here to be guided through these activities](https://docs.google.com/presentation/d/1_SEn8VChlf8Iu1HglIvLrIykhfyIEXycIuWVLx5fKLA/edit#slide=id.g2ebd8828116_0_779).

## Files and set up

This repository contains some mock scripts and files to mimic what a code analysis repository might look like so Docker within this context can be demonstrated. There are also alternative instructions for if people prefer to use [`podman` and open source command line container management software](https://podman.io/). 

There are four activities:  

- [`activity-1-pulling-a-docker-image`](https://hutchdatascience.org/containers-for-scientists-sandbox/activity-1-instructions.html)
- [`activity-2-modify-a-docker-image`](https://hutchdatascience.org/containers-for-scientists-sandbox/activity-2-instructions.html)
- [`activity-3-building-a-docker-image`](https://hutchdatascience.org/containers-for-scientists-sandbox/activity-3-instructions.html)
- [`activity-4-troubleshooting-a-docker-image`](https://hutchdatascience.org/containers-for-scientists-sandbox/activity-4-instructions.html)

Additionally, the `utils` folder has files that are referenced by some of the GitHub Actions. The `data` folder has a dataset that is utilized by the mock analysis files that are used for this tutorial.

### Mock analysis file set up

### Usage:

To re-run the entire "analysis", run `sh run_analysis.sh` in a Terminal or Command Prompt. You will need Python and R installed on whatever environment you choose to run it.

### Description of the files and folders

- `run_analysis.sh` - this script represents a main script that can be called to re-run the entire analysis.
- `01-python_test.py` - this script represents a python script that is called by `run_analysis.sh`. In order for it to be run by GitHub actions, the Docker image or other environment would need to have Python installed.
- `02-r_test.R` - this script represents an R script that is also called by `run_analysis.sh`. In order for it to be run by GitHub actions, the Docker image or other environment would need to have R installed.
- `03-make-a-plot.Rmd` - This file is an R Markdown file, which is commonly used for data analysis notebook output (it creates the `03-make-a-plot.html` when run). In order for it to be run by GitHub actions, the Docker image or other environment would need to have R and RMarkdown and other packages used by the Rmd installed.

### Data folder

The data folder represents where data might be kept for an analysis. Often times files that are too big to be stored on GitHub might need to be stored elsewhere and downloaded by a data download script.
