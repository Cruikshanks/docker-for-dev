# Sets the base image
FROM node:8.4.0

# Use an env var to hold what will be the main directory within the container.
# As we need to refer to it a few times it can be easier to set an env var
# and then refer to it in subsequent commands
ENV APP_HOME /app

# This will execute any commands in a new layer on top of the current image and
# commit the results. In this case we create the /app directory
RUN mkdir $APP_HOME

# Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD
# instructions that follow it
WORKDIR $APP_HOME

# Copies new files or directories from <src> and adds them to the filesystem of
# the container at the path <dest>
COPY ./package.json $APP_HOME

# Here we tell docker to download our projects dependencies, then move that
# folder to the root (why explained below) in another layer that then gets
# committed
RUN npm install \
    && mv $APP_HOME/node_modules /node_modules

# ##############################################################################
# Npm unlike Bundler defaults to installing dependencies within the local
# project. That's fine when developing on the host, but as we want to install
# them as part of the image and have them present in the container when we start
# developing we face a problem.
#
# To use the container for development we mount the project folder to /app when
# calling `docker run`. If the container's app folder still held `node_modules`,
# the bind would cause it to become hidden as it doesn't exist on the host. We
# therefore need to move the `node_modules` somewhere else, in this case the
# root.
#
# In doing so we take advantage of
# https://nodejs.org/api/modules.html#modules_loading_from_node_modules_folders
# and the way Node.js traverses the directory tree to locate dependencies.
# ##############################################################################

# Informs Docker that the container should listen on the specified network port
# at runtime. EXPOSE does not make the ports of the container accessible to the
# host. To do that, you must use still use the `docker run` -p flag
EXPOSE 3000

# There can only be one CMD instruction in a Dockerfile. If you list more than
# one CMD then only the last CMD will take effect.

# Purpose of a CMD is to provide defaults for an executing container. In this
# case it sets the command and arguments to be executed when running the image
CMD ["/node_modules/.bin/nodemon", "server.js"]
