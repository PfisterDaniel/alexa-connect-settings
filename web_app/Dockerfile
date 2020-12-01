FROM node:12.18

ENV NODE_ENV <Environment-Variable>

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production
COPY . .

CMD ["npm", "start"]

EXPOSE 3000
