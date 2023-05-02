# YOLOv5 🚀 by Ultralytics, GPL-3.0 license

#FROM openvino/ubuntu18_dev:2021.4 as openvino_dependencies

# Start FROM Nvidia PyTorch image https://ngc.nvidia.com/catalog/containers/nvidia:pytorch
# CUDA: 11.3
FROM nvcr.io/nvidia/pytorch:21.05-py3

# Install linux packages
RUN apt update && apt install -y zip htop screen libgl1-mesa-glx

# Install python dependencies
RUN python -m pip install --upgrade pip && \
    mkdir /YOLOv6
WORKDIR /YOLOv6

COPY requirements.txt .
RUN pip install --no-cache -r requirements.txt && \
    rm requirements.txt

# Install OpenVino dependencies so we can use Neural Compute Stick via `torch-ort-infer` package
#RUN mkdir -p /openvino /etc/udev/rules.d/
#COPY --from=openvino_dependencies /opt/intel/openvino/deployment_tools/ /openvino/deployment_tools/
#RUN cp "/openvino/deployment_tools/inference_engine/external/97-myriad-usbboot.rules" /etc/udev/rules.d/
