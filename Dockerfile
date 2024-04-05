FROM node:18-alpine

ENV NODE_ENV=production

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

WORKDIR /app/svelte

RUN npm ci

RUN npm run build
RUN npm prune --production
RUN npm install

ENV NODE_ENV=production

CMD ["sh", "-c", "npm run start"]