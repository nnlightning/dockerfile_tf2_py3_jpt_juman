FROM tensorflow/tensorflow:2.0.1-py3-jupyter

RUN apt-get update -y && \
    apt-get install apt-transport-https

RUN apt-get upgrade -y && \
    apt-get install build-essential -y && \
    pip install --upgrade pip

RUN apt-get install wget -y && \
    apt-get install cmake -y

RUN cd /usr/local/src && mkdir juman && cd juman && \
    wget https://github.com/ku-nlp/jumanpp/releases/download/v2.0.0-rc3/jumanpp-2.0.0-rc3.tar.xz && \
    tar xvf jumanpp-2.0.0-rc3.tar.xz && \
    cd jumanpp-2.0.0-rc3/ && mkdir build && cd build/ && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make && \
    make install && \
    rm -R /usr/local/src/juman

RUN pip install pandas && \
    pip install scikit-learn && \
    pip install xgboost && \
    pip install tqdm && \
    pip install keras && \
    pip install nltk && \
    pip install pyknp
