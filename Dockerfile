FROM ubuntu:18.04
RUN apt -y update && apt -y upgrade
RUN apt -y install gcc g++ build-essential python3.7-distutils
RUN apt -y install python3.7 python3.7-dev
RUN apt -y install curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.7 get-pip.py && rm -f get-pip.py
RUN pip install numpy Cython
RUN pip install pystan
RUN pip install pandas scikit-learn scipy matplotlib Pillow ipython[all] statsmodels tensorflow tensorflow-probability seaborn
RUN pip install jupyter
RUN mkdir -p /notebook/work
COPY ./src/jupyter_notebook_config.py /notebook/
WORKDIR /notebook
ENTRYPOINT ["jupyter-notebook", "--allow-root", "--notebook-dir=/notebook/work" ]
