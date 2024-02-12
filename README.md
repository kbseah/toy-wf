Toy Snakemake example to troubleshoot containerization of workflow with global conda directive

Snakemake 8 introduced a [global conda directive](https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html#global-workflow-dependencies)

However, as of Snakemake v8.3.7, this does not appear to work with the [containerization](https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html#containerization-of-conda-based-workflows) of the workflow into a container image with the `--containerize` option.

In this repo, the `master` branch could be containerized:

```bash
git checkout master
snakemake --sdm conda --cores 1 # runs successfully
snakemake --containerize > Dockerfile # runs successfully
```

The image is published at `docker://kbseah/toy-wf:latest`:

```bash
snakemake --sdm apptainer --cores 1 # use container image instead, runs successfully
```

However, if a global conda directive is added to the workflow, the `snakemake --containerize` command fails:

```bash
git checkout global
snakemake --sdm conda --cores 1 # runs succesfully with global conda directive
snakemake --containerize > Dockerfile # fails
```
