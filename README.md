# Docker for development

Using **Docker** for local development is different to actually building images that you expect to be deployed and run as containers elsewhere.

Essentially the aim for local development is to simplify creating the necessary environment for running your app.

So for example the main docker tutorial assumes I have Python and PIP installed locally so that I can then grab the project's dependencies. The `Dockerfile` focuses on *copying* the project including dependencies into an image, and specifying its startup behaviour.

For local development I'm more interested in starting a container that contains everything I need to build and run my app, whilst still be able to make changes to the project, and have that reflected in the running application (assuming you're building in dynamic rather than a static language).

This project is the result of my initial attempts to understand how to do this.

## Docker for ruby development

The first of two examples. This demonstrates how you can use **Docker** to provide the environment for developing a basic ruby [Sinatra](http://www.sinatrarb.com/) application.

See its [README](/ruby) for further details.

## Docker for node development

The second example. This demonstrates how you can use **Docker** to provide the environment for developing a basic Node.js [Express](https://expressjs.com/) application.

See its [README](/node) for further details.

## Contributing

If you think I'm doing something wrong or have a better way create an issue or better yet raise a pull request and show me.

## License

This information is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

> If you don't add a license it's neither free or open!
