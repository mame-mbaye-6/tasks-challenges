# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install dependencies
RUN npm install

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define the command to run the app
CMD ["node", "app.js"]
