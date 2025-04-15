# Use the official Python 3.8 slim image as the base image
# This image is smaller and ideal for production environments, providing only the essentials.
FROM python:3.8-slim

# Set the working directory in the container to /app
# All commands following this will be executed within the /app directory inside the container.
WORKDIR /app

# Copy the requirements.txt file into the container’s working directory.
# This file contains all Python dependencies (Flask, Flask-CORS).
COPY requirements.txt .

# Install the Python dependencies in the container using pip.
# The --no-cache-dir option prevents pip from caching packages, reducing image size.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application code from the local machine to the container’s working directory.
# This includes all the Python code (app.py), templates, and static files.
COPY . .

# Expose port 5000, which is the default port for Flask applications.
# This is necessary for the container to communicate with the outside world.
EXPOSE 5000

# Set the default command to run when the container starts.
# This command runs the Flask app in app.py using Python.
CMD ["python", "app.py"]
