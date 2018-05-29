FROM wordpress:latest

RUN apt-get update && apt-get install -y sudo less

RUN cli_version=1.5.1 && \
    curl -L "https://github.com/wp-cli/wp-cli/releases/download/v${cli_version}/wp-cli-${cli_version}.phar" > /usr/bin/wp && \
    chmod +x /usr/bin/wp