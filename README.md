# broc-cli-geo

Build reproducible online computation for the commandline interface *for geo*. Learn geo at the unix command-line by using it in your browser.

Tools and techniques you will learn:

* GDAL/OGR
* TopoJSON
* more!

### develop the content

If you have an idea for new content, please create an issue to discuss it.

To add content you just add a new .md file in the `/markdown` directory. Take a look at other files in that directory for the naming scheme and layout.

### build and deploy the frontend

You'll need node.js

```bash
# install and set up nvm and node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.bashrc

# some dependencies don't work with node 1+, so stick with 0.12
nvm install 0.12
nvm use 0.12
```

Once you've got node installed, grab this repo and let node install the dependencies:

```bash
git clone https://github.com/Blahah/command_line_bootcamp.git
cd command_line_bootcamp
npm install
```

Make your changes (if any) and then deploy:

```bash
npm run deploy
```

### setup and run the docker server backend

Instructions for running on digitalocean:

Create a new instance of the Ubuntu+docker image.

then ssh in and...

```bash
# keep it running
tmux

# need some basics
apt-get update
apt-get install -y build-essential g++

# install and set up nvm and node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.bashrc

# some dependencies don't work with node 1+, so stick with 0.12
nvm install 0.12
nvm use 0.12

# major dependencies
npm install --global docker-browser-server

# setup docker
docker pull ubuntu
git clone https://github.com/joeyklee/command_line_bootcamp.git
cd command_line_bootcamp
docker build -t "geo_commandline_bootcamp" .
docker-browser-server geo_commandline_bootcamp -p 8081
```

### cleaning up long-running containers

Sometimes people leave their browser windows open for a really long time. If you don't want to fund the docker container running for that time, you can clean up long-running containers:

```bash
docker stop $(docker ps | grep hours | cut -d ' ' -f1 | paste - - - - )
```
