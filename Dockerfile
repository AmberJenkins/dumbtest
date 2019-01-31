FROM continuumio/miniconda3:latest

RUN conda update -yn root --all && \
    conda install -yn root \
            numpy \
            scikit-learn \
            pandas && \
    mkdir -p /code

WORKDIR /code

EXPOSE 8000

ADD run-test.py /code/

RUN chmod +x /code/run-test.py

ENTRYPOINT ["./run-test.py"]
