# Noe template for sinatra web applications

This project provides a [Noe](https://github.com/blambeau/noe) template for
creating a sinatra web application.

## Install

* You'll need Noe to use this template, see: https://github.com/blambeau/noe
* You'll also need bundler, see http://gembundler.com/
* Copy the whole folder in your noe skeleton folder (defaults to ~/.noe)

In other words

    [sudo] gem install noe bundler
    cp {this whole folder} ~/.noe

### Creating a ruby project

    # Prepare generation
    noe prepare --template=sinatra foo
    cd foo

    # Edit specific information about your project
    edit foo.noespec

    # Let Noe generate your project
    noe go

    # Install your ruby dependencies
    ./script/bootstrap
