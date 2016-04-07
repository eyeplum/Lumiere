# Swift on Docker

To run the slides:
 
```sh
$ git clone git@github.com:eyeplum/Lumiere.git
$ cd /Lumiere
$ swift lumiere.swift swift_on_docker.json
```

`lumiere.swift` can only run on OS X (with Swift 2.2 comes with Xcode 7.3) for now, since it depends on `Foundation.framework` while [swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation) is not quite ready.

## What's Docker?

- [docker.com](https://www.docker.com)

  > Let you separate your applications from your infrastructure,

  > and treat your infrastructure like a managed application,

  > ...without a hypervisor.


## What can we use Docker for?

- Run the latest development snapshot on Ubuntu


## Build a Docker image

- Docker image: your infrastructure, considered immutable

- Built by reading the instructions from a Dockerfile

- What's in our Dockerfile

  	- Add Ubuntu as a dependency

  	- Install necessary packages (clang/libxml/libicu...)

 	- Download and verify the latest Swift development snapshot

  		- Only the `development` branch contains the Swift Package Manager

- `$ docker build`

- Example: [Dockerfile in eyeplum/swift-dev](https://github.com/eyeplum/swift-dev/blob/master/Dockerfile)


## Run the Docker image in a container

- Docker container: running image + runtime user data

	- Containers are considered short running and easily re-creatable

  	- Don’t put important user data in containers, copy them as resources

  	- See: [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)

- `$ docker run`

- `$ docker cp file_to_copy container_id:destination_file_path`

- Example: A simple Swift script running in OS X and an Ubuntu container


## Share the Docker image on Docker Hub

- [hub.docker.com](https://hub.docker.com)

- Upload Docker images

- Automated Build

	- Link with a GitHub repo

  	- Build images automatically (when pushed to repo)

- `$ docker pull namespace/image_name`

- Example: [eyeplum/swift-dev](https://hub.docker.com/r/eyeplum/swift-dev/)


## _TODO: Developing and Testing projects for swift.org in Docker_

- Only dependencies are built into the image

- All related projects are copied into the container as resources

- Build products and run unit tests in containers

- Example: [[WIP] eyeplum/swift-foundation-dev](https://github.com/eyeplum/swift-foundation-dev/blob/master/Dockerfile)
