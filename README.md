# Jupyter in Docker for Physics
Jupyter in Docker with all tools for the CMT research group at the UAntwerpen

## Contents
This Jupyter contains everything in the "official" datascience notebook image of Jupyter based on Python 3.9.13.

The difference is that it also containst the following modules (some were already there):

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

## Installation:
* Install for `bash` and `zsh` by adding the content of the add_to_Xrc files to the rcfiles of the shell that you are using:<br>*Easiest way to do this: `cat add_to_zshrc >> ~/.zshrc ; cat add_to_bashrc >> ~/.bashrc`*
* Reload your shellconfig:<br>*Use `source` on your rcfile or way easier: Just open a new terminal (and close the current one)*

## Usage
* To start: Run `jupyter-start`, this command will output the url to the notebook<br>*The first time you run it, it will have to download the image first. This can take a couple of minutes...*
* To stop: `jupyter-stop`<br>*(The container will be stopped and removed, the image will not be removed)*
* To update the image:
  * Stop jupyter if it is still running: `jupyter-stop`
  * Remove the current version: `docker rmi garo/jupyter`
  * The next time you start jupyter the newest version will automatically be downloaded
