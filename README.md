# odd-target-java

Java Swing target for the [Odd software renderer](https://github.com/dstrekelj/odd) project.

Provides an implementation of the target-specific rendering context and framebuffer.

**Note**, make sure you have JDK 1.7 or greater installed on your computer. 

## Installation

To install both the Odd dependency and this target, run the following commands from your command line:

```
haxelib git odd https://github.com/dstrekelj/odd.git
haxelib git odd-target-java https://github.com/dstrekelj/odd-target-java.git
```

If you don't have git, do the following:

```
haxelib dev odd path/to/downloaded/odd/repository
haxelib dev odd-target-java path/to/downloaded/odd-target-java/repository
```

## Usage

Include the following flags in your project's .hxml file:

```
-lib odd
-lib odd-target-java

-java out/java/
```
