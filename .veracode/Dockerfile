FROM --platform=linux/amd64 node:latest

# Install Veracode CLI
RUN curl -sSL 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xdf7dd7a50b746dd4' | gpg --dearmor -o /usr/share/keyrings/veracode-sca-archive.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/veracode-sca-archive.gpg] https://download.sourceclear.com/ubuntu stable/' | tee /etc/apt/sources.list.d/veracode-sca.list
RUN apt-get update
RUN apt-get install srcclr

RUN curl -fsS https://tools.veracode.com/veracode-cli/install | sh
RUN mv veracode /usr/local/bin/veracode

CMD ["bash"]