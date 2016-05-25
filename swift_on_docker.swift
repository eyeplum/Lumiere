let slides = Slides(pages: [

  // Title	

  Cover(title: "Swift on Docker", bulletPoints: ["v0.3"]),

  // Section 1

  Page(title: "What is Docker", bulletPoints: [
    "Let you separate your applications from your infrastructure,",
    "and treat your infrastructure like a managed application,",
    "...without a hypervisor.",
  ]),

  Page(title: "Inside Docker", bulletPoints: [
    "Linux Containers",
    "VirtualBox for virtualize Linux Kernal on OS X / Windows",
    "Docker for Mac and Windows Beta",
    "  xhyve VM (based on Hypervisor.framework) on OS X",
    "  Hyper-V VM on Windows",
  ]),

  Page(title: "What can we use Docker for", bulletPoints: [
    "Run the latest development snapshot",
    "Build and test swift.org projects",
  ]),

  Page(title: "Build a Docker image", bulletPoints: [
    "Docker image: your infrastructure, considered immutable",
    "Built by reading the instructions from a Dockerfile",
  ]),

  Cover(title: "Example: eyeplum/swift-dev", bulletPoints: []),

  // Section 2

  Page(title: "Run the image in a container", bulletPoints: [
    "Docker container: running image + runtime user data",
    "Containers are considered short running and easily re-creatable",
    "Don't put important user data in containers",
    "  Copy them as resources",
    "  Load them as data volumes",
    "See: Best practices for writing Dockerfiles",
  ]),

  Cover(title: "Example: drawRect.swift", bulletPoints: []),

  // Section 3

  Page(title: "Share the image on Docker Hub", bulletPoints: [
    "Upload Docker images",
    "Automated Build",
    "  Link with a GitHub repo",
    "  Build images automatically (when pushed to repo)",
    "$ docker pull namespace/image_name",
  ]),

  // Section 4

  Page(title: "Swift.org on Docker", bulletPoints: [
    "Only dependencies are built into the image",
    "All related projects are loaded into the container as a data volume",
    "Build and test in containers",
  ]),

  Page(title: "swift-corelibs-foundation", bulletPoints: [
    "-v <path to projects>:<path in container>",
    "The container should have at least 6GB of RAM",
    "Default RAM is 2GB",
    "  clang: error: unable to execute command: Killed",
  ]),

  Cover(title: "Example: eyeplum/swift-foundation-dev", bulletPoints: []),

  // Ending

  Cover(title: "Thank you!", bulletPoints: ["@eyeplum"]),

  Cover(title: "One more thing...", bulletPoints: []),

])
