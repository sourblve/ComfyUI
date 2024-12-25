# Use an official Python runtime as a base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Clone the ComfyUI repository
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app/ComfyUI

# Fetch tags to ensure version information is available
WORKDIR /app/ComfyUI
RUN git fetch --tags

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Clone the ComfyUI Manager into the custom_nodes directory
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git /app/ComfyUI/custom_nodes/ComfyUI-Manager

# Expose the default port for ComfyUI
EXPOSE 8188

# Command to launch ComfyUI
CMD ["python", "main.py", "--listen", "0.0.0.0", "--port", "8188"]
