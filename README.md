# thrift-data-serialization-example

Schema and example of how to use [Apache Thrift](https://thrift.apache.org) for data serialization between different components, without using RPC/services.

## TL;DR

### Using maven locally

To compile:

```
mvn compile
```

To run:

```
mvn exec:java
```

### Using Docker


Build it :

```
docker build -f Dockerfile -t thrift-test . 
```

Run it:
```
docker run thrift-test
```

## Code structure

Here is the code structure in the repo:

```
.
├── Dockerfile
├── README.md
├── pom.xml
└── src
    └── main
        ├── java
        │   └── org
        │       └── example
        │           └── EventLogger.java
        └── resources
            └── thrift
                └── event.thrift
```              

Here, mainly two files are important:

- `event.thrift` defines an example event schema.
- `EventLogger.java` is an example client which will use the schema and create a JSON out of it and print it. Here is where you can do anything with the generated object (post this event to other service etc.), but for simplicity I am just printing the json on console.

Infrastructure files:

- `Dockerfile` is uses `mvn` image and installs `thrift` into it. `Dockerfile` is very simple right now. It currently is not optimized and downloads maven dependencies each time, for example.
- `pom.xml` is for `mvn` and defines code dependencies, how to compile the project etc.

This is the final generated and compiled code structure.

```
.
├── Dockerfile
├── README.md
├── pom.xml
├── src
│   └── main
│       ├── java
│       │   └── org
│       │       └── example
│       │           └── EventLogger.java
│       └── resources
│           └── thrift
│               └── event.thrift
└── target
    ├── classes
    │   ├── event.thrift
    │   ├── org
    │   │   └── example
    │   │       ├── Event$1.class
    │   │       ├── Event$EventStandardScheme.class
    │   │       ├── Event$EventStandardSchemeFactory.class
    │   │       ├── Event$EventTupleScheme.class
    │   │       ├── Event$EventTupleSchemeFactory.class
    │   │       ├── Event$_Fields.class
    │   │       ├── Event.class
    │   │       ├── EventLogger.class
    │   │       ├── EventName.class
    │   │       └── State.class
    │   └── thrift
    │       └── event.thrift
    ├── generated-sources
    │   └── thrift
    │       └── org
    │           └── example
    │               ├── Event.java
    │               ├── EventName.java
    │               └── State.java
    └── maven-status
        └── maven-compiler-plugin
            └── compile
                └── default-compile
                    ├── createdFiles.lst
                    └── inputFiles.lst
```