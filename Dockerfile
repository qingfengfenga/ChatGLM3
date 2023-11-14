ARG NVIDIA_CUDA_VERSION=11.8.0-devel-ubuntu22.04

FROM nvidia/cuda:$NVIDIA_CUDA_VERSION as builder

RUN apt-get update && \
    apt-get install -y build-essential python3 python3-pip git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip3 install --no-cache-dir setuptools wheel

RUN pip3 install --no-cache-dir -r requirements.txt

ENV LC_ALL=C.utf8

WORKDIR /app

COPY . .

# OpenAI API
EXPOSE 8000

# Web_demo2
EXPOSE 7860

# Web_demo2
EXPOSE 8501

CMD ${CLI_ARGS}