# Mobility network analysis from mobile phone data

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ssciwr/mobile-phone-network-analysis/ci.yml?branch=main)](https://github.com/ssciwr/mobile-phone-network-analysis/actions/workflows/ci.yml)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ssciwr/mobile-phone-network-analysis/main)

This project analyses raw mobile phone data and produces a mobility network between antennas. Additionally, it allows to map this network to a network of geographic regions using Voronoi tesselations. The implementation based on [pyspark](http://spark.apache.org/docs/latest/api/python/) represents a trade-off between simplicity of the implementation and scalability of the analysis.

## Installation

It is possible to run the code in this repository without installation using above Binder link - though the available RAM is quite limiting.
If you want to run locally, we recommend installing the software stack for this project using [Conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html):

```
git clone https://github.com/ssciwr/mobile-phone-network-analysis.git
cd mobile-phone-network-analysis
conda env create -f environment.yml --force
```

## Usage

The code is provided as a number of Jupyter notebooks in the `notebooks` directory:

* `mobilitymatrix.ipynb` implements the large scale data analysis of call data using PySpark and creates an antenna-to-antenna mobility matrix from that data. The result is stored as `numpy` data structure.
* `mobilitymatrix_pandas.ipynb` is a proof-of-concept reference implementation of the above in `pandas`.
* `tesselation.ipynb` allows to remap the previously generated antenna-to-antenna matrix to a mobility matrix between geographic regions. In the process it uses Voronoi tesselations.
* `timedistribution.ipynb` allows to inspect the raw data for distributions of times betweensingle user events. This is interesting to get an understanding of whether a thresholding is necessary.
* `syntheticdata.ipynb` can be used to generate synthetic data to test the code in absence of real data.

The notebooks can be run from the frontend which can be started like this:

```
conda activate mobile-phone-network-analysis
jupyter lab
```

Alternatively, the notebooks can be used from a command-line interface using `nbclick`.
To learn about possible configuration values, do the following:

```
python -m nbclick NOTEBOOK --help
```

## Data availability

The original data that was used for this project cannot be shared under a free license.
If you have similar data, you may place it in the `data` subdirectory. If you do not
have access to data, you can generate synthetic data:

```
nbclick ./notebooks/syntheticdata.ipynb --filename ./data/synthetic.txt
```

If you want to tweak more characteristics of the generated dataset, you may set more parameters:

```
nbclick ./notebooks/syntheticdata.ipynb --help
```

Alternatively, you can also run the `syntheticdata.ipynb` notebook directly from Jupyter.
## License + Copyright

This repository is the outcome of a collaboration between Steffen Knoblauch ([GIScience Research Group](https://www.geog.uni-heidelberg.de/gis/index_en.html), Heidelberg University) and Dominic Kempf ([Scientific Software Center](https://ssc.iwr.uni-heidelberg.de), Heidelberg University). The software in this repository is provided under the MIT license.
