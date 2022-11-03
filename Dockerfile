# Based on scipy-notebook of the Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/datascience-notebook:python-3.9.13
ARG BUILDCORES=1
FROM $BASE_CONTAINER

LABEL maintainer="Nikolas Garofil <nikolas.garofil@uantwerpen.be>"

USER root

# ffmpeg for matplotlib anim & dvipng+cm-super for latex labels
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends ffmpeg dvipng cm-super cmake && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# Install Python 3 packages
RUN mamba install --quiet --yes \
    'altair' \
    'ase' \
    'beautifulsoup4' \
    'bokeh' \
    'bottleneck' \
    'cloudpickle' \
    'conda-forge::blas=*=openblas' \
    'cython' \
    'dask' \
    'dill' \
    'fortranformat' \
    'h5py' \
    'ipympl'\
    'ipywidgets' \
    'keras' \
    'kwant' \
    'maml' \
    'matplotlib-base' \
    'monty' \
    'numba' \
    'numexpr' \
    'pandas' \
    'patsy' \
    'protobuf' \
    'py4vasp' \
    'pybinding' \
    'pymatgen' \
    'pytables' \
    'scikit-image' \
    'scikit-learn' \
    'scipy' \
    'seaborn' \
    'sqlalchemy' \
    'statsmodels' \
    'sympy' \
    'tensorflow' \
    'widgetsnbextension'\
    'xlrd' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

RUN pip3 install hublib==0.9.96 
RUN pip3 install spirit
#RUN pip3 install kite #FOUTE kite DOET IETS HEEEEELEMAAL ANDERS

# Install facets which does not have a pip or conda package at the moment
WORKDIR /tmp
RUN git clone https://github.com/PAIR-code/facets.git && \
    jupyter nbextension install facets/facets-dist/ --sys-prefix && \
    rm -rf /tmp/facets && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER root

RUN apt-get update && apt-get -y install software-properties-common
RUN add-apt-repository ppa:gladky-anton/lammps && add-apt-repository ppa:openkim/latest && apt-get update && apt-get -y install lammps-stable

#4 aanpassen naar cores
RUN git clone https://github.com/quantum-kite/kite && cd kite && rm -rf .git && \
cmake . && make -j $BUILDCORES install && cd tools && cmake . && make -j $BUILDCORES install && \
python --version | perl -ne '/^\S+\s+(\d+\.\d+)/; system "mv /tmp/kite /opt/conda/lib/python$1/kite"'

USER ${NB_UID}

# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"

RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions "/home/${NB_USER}"

USER ${NB_UID}

WORKDIR "${HOME}"
