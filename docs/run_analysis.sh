#!/bin/bash

# This is a mock script that shows how you could have your whole analysis ran by one script call.
## Usage: To re-run this whole analysis, go to bash and

# These specs will make sure that if one script fails this will fail the script
set -e

my_dir="$(dirname "$0")"

## Run the first step
python3 "$my_dir/01-python_test.py"

## Run the second step
Rscript "$my_dir/02-r_test.R"

## Run a third step
Rscript -e "rmarkdown::render('$my_dir/03-make-a-plot.Rmd')"
