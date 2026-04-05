FROM node:18-alpine

ENV HOME=/home/node
ENV NPM_CONFIG_CACHE=/home/node/.npm

# Ensure correct directories exist
RUN mkdir -p /home/node/app /home/node/.npm && chown -R node:node /home/node

WORKDIR /home/node/app

USER node