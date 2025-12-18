FROM node:20-alpine AS production

WORKDIR /app

# Copy only runtime dependencies
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Copy built files from build stage
COPY --from=build /app/dist ./dist

# Expose port and start server
EXPOSE 3000
CMD ["npm", "run", "build"]