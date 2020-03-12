FROM ubuntu:latest

RUN apt-get update && apt-get install -y git zsh curl 

RUN mkdir -p /root/dotfiles/dotfiles
COPY dotfiles/ root/dotfiles/dotfiles/.
COPY zsh_custom_plugins/ root/dotfiles/zsh_custom_plugins/.
COPY antigen.zsh setup.sh root/dotfiles/

RUN bash /root/dotfiles/setup.sh
RUN ln -f /bin/zsh /bin/sh

WORKDIR /root/
CMD ["zsh"]
