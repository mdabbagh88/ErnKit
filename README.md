# ErnKit

[![Build Status](https://travis-ci.org/ernstsson/ErnKit.png?branch=master)](https://travis-ci.org/ernstsson/ErnKit)

ErnKit is a framework with a set of helper classes / protocols and a sample 
project showing how an iOS project can be broken down into isolated and unit 
testable components. The framework contains protocols for defining a model 
layer, as well as a set of helpers using these protocols to show data in 
table views, map views, as well as getting the data from a RESTful service 
using RestKit.


## Using the framework

The framework can be used as a [CocoaPod](http://cocoapods.org/) by adding 
the following in your Podfile:

    pod 'ErnKit'

After updating your pods all protocols and helpers can be imported like this:

    #import <ErnKit/ERNAction.h>

## Running the demo

Clone the project and run the following commands:

    brew update
    brew install xctool
    bundle install
    pod install
    open ErnKit.xcworkspace

Xcode will now open and the demo app can be executed from here. To start the 
demo server run the following command:

    rake server:start

To stop it:

    rake server:stop

## Running the unit tests

Run the unit tests using the following command:

    rake test

or simply just:

    rake

## Patterns and structures defined by ErnKit

ErnKit defines a set of protocols that defines the overall structure of an 
iOS application. By adhering to these protocols a lot of the helper classes 
in ErnKit can be used to achieve a lot writing very little code. ErnKit itself 
is not a "stack" but a set of components thus exposes all its abstractions in 
order to be able to choose a level appropriate for the application.

### Managing data objects using Asynchronous Repositories

The model of ErnKit consists of two "parts":

1. Simple data objects containing nothing but properties and isolated methods
2. Asyncrounous Repositories containing one or several of these data objects

The basic idea is to let the repositories hold the model "state" by holding 
the data objects. The repositories can be updated at any time, and will notify 
any interested observer when this happens.

A simple example repository could contain a simple object in memory. More 
complex repositories represents the state of data from a data base or a 
RESTful server. Either way, the client of the repositores will look the same.

ErnKit defines a set of repository protocols

- ERNAsyncRepository - the base protocol with common asynchronous methods
- ERNAsyncItemRepository - containing a single object
- ERNAsyncItemsRepository - containing a list of objects
- ERNPaginatedAsyncItemsRepository - containing a paginated list of objects

For example, a repository client can get an object from an 
ERNAsyncItemsRepository like this:

    id<NSObject> object = [repository itemAtIndex:0];

TBD...

### Breaking sub-system dependencies with Action/Configurator/Transitioner

TBD...

### Breaking down UIViewControllers with Micro Controllers

TBD...

