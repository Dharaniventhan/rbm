# Step 1: Use an official Python image as the base image
FROM python:3.11-slim

# Step 2: Set environment variables to avoid prompts during installation
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Step 3: Install necessary system dependencies for picamera2 and opencv
RUN apt-get update && apt-get install -y \
    libcap-dev \
    build-essential \
    libopencv-dev \
    libcamera-dev \
    && rm -rf /var/lib/apt/lists/*

# Step 4: Set the working directory inside the container
WORKDIR /app

# Step 5: Copy the requirements.txt file into the container
COPY requirements.txt .

# Step 6: Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 7: Copy the rest of the application code into the container
COPY . .

# Step 8: Expose the port the app will run on (default for Flask is 5000)
EXPOSE 5000

# Step 9: Specify the command to run the app (using Gunicorn)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "surveillance:app"]
