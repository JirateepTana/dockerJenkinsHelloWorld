FROM node:20-alpine AS base

WORKDIR /app

COPY hello-world/package.json hello-world/yarn.lock* ./

RUN yarn install --frozen-lockfile

COPY hello-world/ ./

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]