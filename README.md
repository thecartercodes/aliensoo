## Aliensoo

### Overview

This repo sets a rudimentary data stack to analyze logs from the National UFO Reporting Center. We construct a data cube using some basic dimensions associated with Canadian census divisions and
dates.

### Quick Start

1. Download the csv from the prompt into the `seeds/data` file.

2. Start the database with `make up`, you'll need Docker installed.

3. Make the migrations and seeds with `make migrate`, `make seed`

4. Run `bash scripts/census_division.sh

5. Build the transformations with `make build`

By default, the dbt project `stargazer` points to the local database and any table can be dumped to a csv. Install `stargazer/requirements.txt` to your virtualenv to use the `dbt` CLI.

### Examples
We use ObservableHQ to create some visualizations from the analytics.

Find examples here - [Link](https://observablehq.com/d/a0ed3bb6c7f61929)
