# dot_files
A guide to installing an Ubuntu based tools for command line file manipulation, data analysis, and data science

Configuration files for favorite CLI software vim, tmux, and psql

## Prerequisites

### Install git
    - Guide here for installing on Linux, Mac, and Windows: gist.github.com/derhuerst/1b15ff4652a867391f03
        - For Windows 10:
            - enable bash
            - install Linux distro 
            - install git for bash gitforwindows.org
        - For Mac:
            - install homebrew
            - install git `brew install git`
    - Use vim as git editor
        - `git config --global core.editor vim`

### Install vim
    - Must have vim (Vi IMproved) installed
    - Must clone the solarized color scheme: `git clone https://github.com/altercation/vim-colors-solarized`

### Install tmux

## For Data Analysis

### Install psql - command line sql client
    - 

### Install Anaconda - Python, R, Jupyter package manager for data science
    - On windows:

#### Install Conda env tools 
    - Create and activate conda environment
        `conda create -n myenv`
        `conda activate myenv`
    - Common packages to get started
        `conda install numpy pandas scipy matplotlib seaborn scikit-learn`
        `conda install -c conda-forge jupyterlab`
