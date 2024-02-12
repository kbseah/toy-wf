FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="3f8125b9d351baffbba4fd668799cbea679a129afaab19e91cc067fc0790e6ef"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: workflow/envs/black.yaml
#   prefix: /conda-envs/21ac3f52d4b455b23f615ed7f0d2307d
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - black >=24
RUN mkdir -p /conda-envs/21ac3f52d4b455b23f615ed7f0d2307d
COPY workflow/envs/black.yaml /conda-envs/21ac3f52d4b455b23f615ed7f0d2307d/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/21ac3f52d4b455b23f615ed7f0d2307d --file /conda-envs/21ac3f52d4b455b23f615ed7f0d2307d/environment.yaml && \
    mamba clean --all -y
