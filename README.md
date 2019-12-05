# dot_files
A guide to installing an Ubuntu based tools for command line file manipulation, data analysis, and data science

Configuration files for favorite CLI software vim, tmux, and psql

Major inspiration from friend Samuel D Corbin: https://github.com/samueldcorbin/dotfiles

# Prerequisites

## bash
    - Guide here for installing on Linux, Mac, and Windows: gist.github.com/derhuerst/1b15ff4652a867391f03
        - For Windows 10:
            - enable bash
            - install Linux distro - Ubuntu is preference
## bootstap.sh
    - After being able to use a bash environment run this script to install git, tmux, vim, and postgresql    

### Install git manually
    - For bootstap.sh - or manually `apt-get install git`
    - For Windows
        - install git for bash gitforwindows.org
    - For Mac:
        - install homebrew
        - install git `brew install git` 

### Install vim
    - bootstap.sh - or manually `apt-get install vim`
        - Must have vim (Vi IMproved) installed
        - Must clone the solarized color scheme: `git clone https://github.com/altercation/vim-colors-solarized`

### Install tmux
    - bootstap.sh - or manually `apt-get install tmux`

### Install psql - command line sql client
    - bootstap.sh - or manually `apt-get install postgresql`

## For Python Data Analysis 

### Install Anaconda - Python, R, Jupyter package manager for data science
    - On windows:

### conda environment creation (WIP section)
    - Create and activate conda environment
        `conda create -n myenv`
        `conda activate myenv`
    - Common packages to get started
        `conda install numpy pandas scipy matplotlib seaborn scikit-learn`
        `conda install -c conda-forge jupyterlab`
