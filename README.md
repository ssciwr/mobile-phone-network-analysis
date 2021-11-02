# Mobility network analysis from mobile phone data

This project analyses raw mobile phone data and produces a mobility network between antennas. Additionally, it allows to map this network to a network of geographic regions using Voronoi tesselations. The implementation based on [pyspark](http://spark.apache.org/docs/latest/api/python/) represents a trade-off between simplicity of the implementation and scalability of the analysis.

## Installation

We recommend installing the software stack for this project using [Conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html):

```
git clone https://github.com/ssciwr/mobile-phone-network-analysis.git
cd mobile-phone-network-analysis
conda env create -f environment.yml --force
```

## Usage

The best way to reproduce the analysis is to manually run the contained Jupyter notebooks:

```
conda activate mobile-phone-network-analysis
jupyter lab
```

## Data availability

The original data that was used for this project cannot be shared under a free license.
If you have similar data, you may place it in the `data` subdirectory. If you do not
have access to data, you can generate synthetic data:

```
python ./bin/generate.py
```

You can also run this directly by running `notebooks/syntheticdata.ipynb` which will also
allow you to tweak the characteristics of the generated dataset.

## License

The software in this repository is provided under the MIT license.
