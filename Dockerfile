# Dockerfile

FROM node:20

WORKDIR /mypro

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]




