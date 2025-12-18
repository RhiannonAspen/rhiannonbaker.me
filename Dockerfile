FROM node:20-alpine

WORKDIR /main

COPY package*.json ./
RUN npm install 

COPY . .

RUN npm run build

EXPOSE 5173
CMD ["npm", "start"]

