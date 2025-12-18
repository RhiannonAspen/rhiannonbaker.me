# ---------- Build Stage ----------
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build


# ---------- Production Stage ----------
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# IMPORTANT: Vite outputs to dist/
COPY --from=build /app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
