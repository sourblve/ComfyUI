# Use an official Python runtime as a base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all contents into the working directory
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the default port for ComfyUI (e.g., 8188)
EXPOSE 8188

# Command to launch ComfyUI
CMD ["python", "main.py", "--listen", "0.0.0.0", "--port", "8188"]
