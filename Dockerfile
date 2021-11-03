FROM jupyter/pyspark-notebook:2021-11-01

# Correct folders in the home directory
RUN mkdir ${HOME}/notebooks &&  \
    rm -rf ${HOME}/work

# Copy the notebooks into the container
COPY --chown=${NB_UID} ./notebooks/*.ipynb ${HOME}/notebooks/

# Make JupyterLab the default for this application
ENV JUPYTER_ENABLE_LAB=yes

# Generate synthetic data
COPY ./bin/generate.py /opt/
RUN mkdir ${HOME}/data && \
    python /opt/generate.py

WORKDIR ${HOME}/notebooks
