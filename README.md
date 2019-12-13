# Usage
## build
```
sudo docker build -t dotfiles .
sudo docker run -it dotfiles
```

### clean
```
sudo docker stop $(sudo docker ps -qa)
sudo docker rm $(sudo docker ps -qa)
```

