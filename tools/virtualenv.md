# virtualenv(python)

This tool generate a independent environment, which you can install depends in this environment and not effect other environment.

### Installing

`$ pip install virtualenv`

or

`$ pip3 install virtualenv`

### Create a virtual environment

`$ virtualenv envfoldername` or `$ virtualenv envfoldername --python=python3.5`

`$ cd envfoldername`

`$ mkdir code`

### Activate environment and deactivate

`$ source bin/activate`

`$ deactivate`

### Install dependencies

`$ pip install sqlalchemy pymysql`
`$ pip install xlwt`
`$ pip install openpyxl`



`$ pip install sqlalchemy pymysql xlwt openpyxl`


### Specify python version

`$ virtualenv TEST --python=python2.7`