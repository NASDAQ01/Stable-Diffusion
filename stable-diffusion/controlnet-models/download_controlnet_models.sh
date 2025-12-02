#!/bin/bash
mkdir -p ~/open-webui/stable-diffusion-webui/models/ControlNet

wget https://huggingface.co/lllyasviel/control_v11p_sd15_canny/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet

wget https://huggingface.co/lllyasviel/control_v11f1p_sd15_depth/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet

wget https://huggingface.co/lllyasviel/control_v11p_sd15_openpose/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet

wget https://huggingface.co/lllyasviel/control_v11p_sd15_lineart/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet

wget https://huggingface.co/lllyasviel/control_v11p_sd15_scribble/resolve/main/diffusion_pytorch_model.safetensors \
  -P ~/open-webui/stable-diffusion-webui/models/ControlNet

