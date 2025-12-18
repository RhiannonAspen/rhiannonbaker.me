# Use a specific, stable base image
FROM node:20-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and yarn.lock (or package-lock.json) first to leverage Docker cache
COPY package*.json ./

# Install application dependencies
RUN npm install --omit=dev

# Copy the rest of the application code to the container
COPY . .

# Inform Docker that the container listens on the specified network port at runtime
EXPOSE 3000

# Define the command to run the application
CMD ["node", "server.js"]
