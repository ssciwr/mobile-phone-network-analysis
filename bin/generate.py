import nbclient
import nbformat


# Read the notebook that generates synthetic data
with open("notebooks/syntheticdata.ipynb") as f:
    nb = nbformat.read(f, as_version=4)

# We might alter the notebook here using nbparameterise!

# Execute it
nbclient.execute(nb)
