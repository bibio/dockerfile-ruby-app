FROM ruby:3.2.2-slim

RUN apt update -qq && \
    apt install -y build-essential libpq-dev git jq curl libmariadb-dev vim && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt update -qq && \
    apt install -y nodejs && \
    npm install -y -g yarn && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app