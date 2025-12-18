# Stage 1: Build the React app
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the static files with Nginx
FROM nginx:alpine
# Copy the built files from the builder stage to Nginx's web directory
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 8080
# Command to start Nginx
CMD ["nginx", "-g", "daemon off;"]
