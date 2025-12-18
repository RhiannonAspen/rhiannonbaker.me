# Stage 1: Build the React application
FROM node:lts-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
RUN npm run build
