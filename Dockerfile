# this Dockerfile sets up the command-line bootcamp Docker image
# usage:
# docker build -t "geo_commandline_bootcamp" .
# docker-browser-server geo_commandline_bootcamp -p 8081

FROM command_line_bootcamp

USER root
RUN apt-get update && apt-get install -y gdal-bin wget

# become the learner
USER learner

ENV HOME /home/learner
WORKDIR /home/learner

# get the data
RUN cd && wget –quiet https://zenodo.org/record/51268/files/geo_data.tar.gz && tar xf geo_data.tar.gz && mv geo_data/* .
RUN cd && rmdir geo_data a_directory another_directory
RUN cd && rm geo_data.tar.gz
