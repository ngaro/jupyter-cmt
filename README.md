# Jupyter in Docker for Physics
Jupyter in Docker with all tools for the CMT research group at the UAntwerpen

This Jupyter contains everything in the "official" datascience notebook image of Jupyter based on Python 3.9.13.

The difference is that it also makes sure that the following modules are available:

* altair
* ase
* beautifulsoup4
* bokeh
* bottleneck
* cloudpickle
* conda-forge::blas=*=openblas
* cython
* dask
* dill
* h5py
* ipympl
* ipywidgets
* keras
* kwant
* maml
* matplotlib-base
* monty
* numba
* numexpr
* pandas
* patsy
* protobuf
* pybinding
* pymatgen
* pytables
* scikit-image
* scikit-learn
* scipy
* seaborn
* sqlalchemy
* statsmodels
* sympy
* tensorflow
* widgetsnbextension
* xlrd

## Usage:
Prepare usage:
* Add the contents of `add_to_zshrc` at the bottom of your `~/.zshrc`<br>**Note that I am assuming that you are using zsh as shell !**<br>*If you are using bash it will probably also work by adding it to `~/.bashrc` but I haven't tested it yet.<br>(It might fail because of small syntax differences)*
* Reload zsh with `source ~/.zshrc`

From now you can run it with `jupyter-start` and stop it with `jupyter-stop`.<br>
The first time you run it, it will have download the image. This can take a couple of minutes...
