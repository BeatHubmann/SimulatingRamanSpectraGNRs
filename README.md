# Simulating Raman spectra: A CP2K-based implementation and its application to defective graphene nanoribbons

![doi:10.5281/zenodo.4018042](https://zenodo.org/badge/DOI/10.5281/zenodo.4018042.svg)

## Project Synopsis

This [project](./report/report.pdf) uses the atomistic simulation software CP2K and Python-based numerical calculations based on density functional theory and the Placzek approximation to obtain Raman characteristics of a selection of graphene nanoribbons representative of the class of graphene nanoribbons fabricated at Empa. The goal of this endeavor is twofold: To estimate whether calculated Raman characteristics match experimental measurements, and to investigate whether the calculated Raman characteristics allow for the identification of and distinction between defects commonly occurring in the bottom-up fabrication of graphene nanoribbons as pioneered at Empa.

## Running the Code

Make sure the Python installation has all the [required packages](./requirements.txt) and Jupyter installed, then run the [Jupyter Notebook](./code/calculate_Raman_spectra.ipynb).

## Contents of Submission

### ```root``` Directory

* ```requirements.txt``` Python ```pip``` requirements file
* ```LICENSE``` MIT License file
* ```README.md``` This file

### ```code``` Directory

* ```calculate_Raman_spectra.ipynb``` Jupyter notebook containing complete computational workflow

### ```data``` Directory

* ```cp2k_vibr_*``` CP2K geometry optimization and vibrational analysis inputs and outputs for molecule type ```*```
* ```NIST_atomic_weights``` Atomic weights and isotopic compositions for all elements sourced from NIST


### ```report``` Directory

* ```report.pdf``` Project report
