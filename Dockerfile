FROM ubuntu:latest

RUN apt-get update && apt-get install -y git zsh tmux curl

RUN mkdir /root/.dotfiles
COPY dotfiles/* install.sh /root/.dotfiles/
RUN bash /root/.dotfiles/setup.sh
RUN ln -f /bin/zsh /bin/sh

WORKDIR /root/
CMD ["/bin/zsh"]
