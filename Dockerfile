# Use a specific, stable base image
FROM node:20-alpine

# Copy package.json and yarn.lock (or package-lock.json) first to leverage Docker cache
COPY package*.json ./

# Install application dependencies
RUN npm install --production

# Copy the rest of the application code to the container
COPY . .

# Define the command to run the application
CMD ["npm", "start"]
