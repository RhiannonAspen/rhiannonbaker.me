# ---------- Build ----------
FROM node:20-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# ---------- Runtime ----------
FROM nginx:alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy fixed nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy Vite build output
COPY --from=build /app/dist /usr/share/nginx/html

# Fix permissions so Nginx can read files
RUN chmod -R 755 /usr/share/nginx/html \
    && chown -R nginx:nginx /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
