<<<<<<< HEAD
# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .
=======
# Use the official Node.js image as the base image
FROM node:14

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
COPY package*.json ./
>>>>>>> 7a651e4 (first task)

# Install dependencies
RUN npm install

<<<<<<< HEAD
# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define the command to run the app
CMD ["node", "app.js"]
=======
# Copy the local code to the container image.
COPY . .

# Run the web service on container startup.
CMD [ "node", "app.js" ]

# Expose port 8080
EXPOSE 8080

>>>>>>> 7a651e4 (first task)
