FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

ARG REQUIREMENTS_FILE

RUN mkdir -p /opt/app

WORKDIR /opt/app

COPY ${REQUIREMENTS_FILE} /opt/app/
RUN pip3 install -r ${REQUIREMENTS_FILE}

# Install dependencies
RUN     DEBIAN_FRONTEND=noninteractive apt-get update \
    &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            build-essential \
            libglib2.0-0 \
            libsm6 \
            libxext6 \
            libxrender-dev \
            tesseract-ocr \
            # libtesseract-dev
