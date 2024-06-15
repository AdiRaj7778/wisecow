# Using an official Ubuntu as a parent image
FROM ubuntu:20.04

# Setting environment variables to avoid user interaction during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay curl && \
    apt-get clean

# Copying the application code to the container
COPY . /app

# Setting the working directory
WORKDIR /app

# Make the wisecow.sh script executable
RUN chmod +x wisecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Define the command to run the application
CMD ["./wisecow.sh"]
