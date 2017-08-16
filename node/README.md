# Using Docker for node development

A basic example of using **Docker** to provide an environment in which you can run and work on your Node.js app.

Specifically in this case we have an [Express](https://expressjs.com/) application with a simple root `GET`, which returns `Hello world` as we want to demonstrate a very basic app that

- has a dependency and so needs a `package.json`
- has something we can interact with from the host
- is basic enough that it won't complicate what we're trying to show in **Docker**

## Build

Assuming what is in this folder represents the project in question, having cloned it locally the first step would be to create an image from it.

```bash
docker build -t docker-for-node-dev .
```

Having run this on a machine clean of other **Docker** images running `docker images` would result in something like

```bash
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
docker-for-node-dev   latest              c7c5150e2d55        2 minutes ago       677MB
node                  8.4.0               5e553613f1d8        17 hours ago        669MB
```
## Run

Now we have an image, we want to create and run a container from it

```bash
docker run --rm -v "$(pwd)":/app -w /app -p 3000:3000 docker-for-node-dev
```

Breaking down this command we have

- `docker run` first creates a writeable container layer over the specified image, and then starts it using the specified command
- `--rm` automatically removes the container on exit
- `-v "$(pwd)":/app` mounts the local folder to `/app` in the container
- `-p 3000:3000` bind port 3000 on the host to 3000 in the container <host:container>
- `docker-for-ruby-dev` the specified image to create and run a container from

Running in this way ensures we see any output from our app. Add the `-d` flag if you prefer the container to run as a daemon.

## Develop

Now we have a container we want to be able to make changes. As we have mounted the project's root folder to `/app` in the container we can open it in our preferred editor, make changes, and see them reflected in the app.

To prove this using our demo project first run `curl -XGET http://localhost:3000` from the host. The response should be `Hello world`.

Edit `server.js` and change line 5 to be `res.send('Hello docker world')`. Running the same `curl` command again should result in `Hello docker world`.
