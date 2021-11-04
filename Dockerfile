FROM jupyter/pyspark-notebook:2021-11-01

# Correct folders in the home directory
RUN mkdir ${HOME}/notebooks &&  \
    rm -rf ${HOME}/work

# Copy the notebooks into the container
COPY --chown=${NB_UID} ./notebooks/*.ipynb ${HOME}/notebooks/

# Make JupyterLab the default for this application
ENV JUPYTER_ENABLE_LAB=yes

# Generate synthetic data
RUN mkdir ${HOME}/data && \
    python -m pip install nbclick && \
    nbclick ./notebooks/syntheticdata.ipynb --filename ./data/synthetic.txt

WORKDIR ${HOME}/notebooks

# Normally this should be initialized within the container, but the
# relevant scripts do not seem to run on mybinder.org. This is my take
# on quick-fixing the issue.
ENV PYTHONPATH=/usr/local/spark/python/lib/py4j-0.10.9.2-src.zip:/usr/local/spark/python
