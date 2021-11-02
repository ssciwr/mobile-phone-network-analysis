import nbclient
import nbformat
import os

# Switch the working directory such that the relative paths in the notebook work
os.chdir("notebooks")

# Read the notebook that generates synthetic data
with open("syntheticdata.ipynb") as f:
    nb = nbformat.read(f, as_version=4)

# We might alter the notebook here using nbparameterise!

# Execute it
nbclient.execute(nb)
