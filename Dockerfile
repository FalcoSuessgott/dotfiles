FROM ubuntu:latest

RUN apt-get update && apt-get install -y git zsh

CMD ["/bin/bash"]
