# pyenv

Docker image containing pyenv and multiple versions of Python. Used as a base image for testing and building Python libraries.

## Available versions

The following Python versions are available in this image:

- 2.7.15
- 3.5.5
- 3.6.5
- 3.7.0
- 3.9.13

## Available libraries

The following libraries are preinstalled globally in this image:

- `tox`: For testing against multiple versions of Python
- `wheel`: For building binary wheels for distribution
