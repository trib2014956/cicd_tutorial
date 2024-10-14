# Use an official Python image as the base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /flask_app

# Copy the requirements.txt file first
COPY requirements.txt requirements.txt

# Install necessary system dependencies and create a virtual environment
RUN apt-get update -y && \
    apt-get install -y python3-venv && \
    python3 -m venv venv && \
    ./venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the virtual environment to the PATH
ENV PATH="/flask_app/venv/bin:$PATH"

# Command to run the Flask app
CMD ["python", "flask_docker.py"]
