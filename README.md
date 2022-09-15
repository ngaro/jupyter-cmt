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
* Install for `bash` and `zsh` by adding the content of the add_to_Xrc files to the rcfiles of the shell that you are using:<br>*Easiest way to do this: `cat add_to_zshrc >> ~/.zshrc ; cat add_to_bashrc >> ~/.bashrc`*
* Reload your shellconfig:<br>*Use `source` on your rcfile or way easier: Just open a new terminal (and close the current one)*

From now you can run it with `jupyter-start` and stop it with `jupyter-stop`.<br>
The first time you run it, it will have download the image. This can take a couple of minutes...
