# Swift on Docker

To run the slides:
 
```sh
$ git clone git@github.com:eyeplum/Lumiere.git
$ cd /Lumiere
$ swift lumiere.swift swift_on_docker.tfft
```

`lumiere.swift` can only run on OS X (with Swift 2.2 comes with Xcode 7.3) for now, since it depends on `Foundation.framework` while [swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation) is not quite ready.

