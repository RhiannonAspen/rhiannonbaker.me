# Use a specific base image
FROM node:lts 

# Set environment variables (Hyperlift handles ports via its own variables)
ENV CI=true

# Set the working directory
WORKDIR /app

# Copy dependency files and install dependencies first (for caching efficiency)
COPY package.json package-lock.json ./
RUN npm ci

# Copy the rest of the application code
COPY . . 

# Define the command to run your application
CMD ["npm", "start"]
