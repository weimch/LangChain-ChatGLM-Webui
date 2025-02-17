FROM nvidia/cuda:11.7.1-devel-ubuntu22.04
RUN apt-get update && \
    apt-get install --no-install-recommends -y git python3 python3-dev python3-pip build-essential libmagic-dev poppler-utils tesseract-ocr libreoffice vim libgl1-mesa-glx aria2 unzip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /build
RUN pip install --upgrade pip
RUN pip install --user torch torchvision tensorboard cython PyPDF2 pdfrw -i https://pypi.tuna.tsinghua.edu.cn/simple
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["python3", "app.py"]
