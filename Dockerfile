FROM jupyter/pyspark-notebook:2021-11-01

# Install repository content
COPY --chown=${NB_UID} . /opt/mobility

# Install Python package
RUN python -m pip install /opt/mobility

# Install Conda environment
RUN conda env update -n base --file /opt/mobility/environment.yml && \
    conda clean -a -q -y

# Move the notebooks to the correct location
RUN mkdir ${HOME}/notebooks &&  \
    rm -rf ${HOME}/work && \
    cp /opt/mobility/notebooks/*.ipynb ${HOME}/notebooks/

# Make JupyterLab the default for this application
ENV JUPYTER_ENABLE_LAB=yes

# Generate synthetic data
RUN mkdir ${HOME}/data && \
    python -m pip install nbclick && \
    nbclick ./notebooks/syntheticdata.ipynb --data_directory ./data

WORKDIR ${HOME}/notebooks

# Normally this should be initialized within the container, but the
# relevant scripts do not seem to run on mybinder.org. This is my take
# on quick-fixing the issue.
ENV PYTHONPATH=/usr/local/spark/python/lib/py4j-0.10.9.2-src.zip:/usr/local/spark/python
