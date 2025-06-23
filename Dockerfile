# stage1

FRO node:20 as builder

WORKDIR /mypro

COPY package*.json ./

RUN npm install

COPY . .

# Stage 2: Runtime Stage
FROM node:20 as runtime

WORKDIR /mypro

COPY --from=builder /mypro /mypro

EXPOSE 5173

CMD ["npm", "run", "dev"]
