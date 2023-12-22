FROM ruby:3.2.2-slim-bookworm

RUN apt-get update && \
    apt-get install -y git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64" \
    --output /tmp/vscode-cli.tar.gz && \
    tar -xf /tmp/vscode-cli.tar.gz -C /usr/bin && \
    rm /tmp/vscode-cli.tar.gz && \
    mkdir /home/playground && \
    gem install bundler

WORKDIR /app
COPY .bashrc /root/.bashrc
COPY . .
RUN chmod 777 rakefile && \
    chmod -R 777 commands

WORKDIR /home/playground
ENV BUNDLE_PATH="/home/playground/.vendor"

CMD ["rake", "-f", "/app/rakefile", "start_code_space"]
