# Sets the base image
FROM ruby:2.4.1

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
COPY . $APP_HOME

# Here we tell docker to download our projects dependencies in another layer
# that then gets committed
RUN bundle install

# Informs Docker that the container should listen on the specified network port
# at runtime. EXPOSE does not make the ports of the container accessible to the
# host. To do that, you must use still use the `docker run` -p flag
EXPOSE 4567

# There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.

# Purpose of a CMD is to provide defaults for an executing container. In this
# case it sets the command and arguments to be executed when running the image
CMD ["rerun", "--background", "server.rb"]
