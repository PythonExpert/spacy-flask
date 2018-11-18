FROM ubuntu:16.04

LABEL author "Shawn Cicoria"

# Installing base software
RUN apt-get update && \
    apt-get install -y git wget nano python3 python3-pip

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -U spacy
RUN python3 -m spacy download en && \
    python3 -m spacy download es

RUN python3 -m pip install Flask

# Download scripts from repo
# RUN git clone https://github.com/jasonjimnz/spacy-flask.git spacy-flask
COPY . /spacy-flask/

EXPOSE 3000

CMD /spacy-flask/run_spacy_flask.py