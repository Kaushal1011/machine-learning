#!/usr/bin/env bash

# Install the Data Science stack in conda environment
if [ -x "$(command -v conda)" ]; then
    conda install -y flask \
                     ipython \
                     jupyterlab \
                     matplotlib \
                     numpy \
                     pandas \
                     pylint \
                     R \
                     requests \
		             seaborn \
                     scikit-learn \
                     scipy \
                     sympy \
                     tensorflow-gpu \
                     yapf
    conda update --all -y
else
    echo 'conda not installed'
    exit 1
fi
