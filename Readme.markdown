# DKPropertyList

`DKPropertyList` is a class that makes it easy to work with [Property List](http://en.wikipedia.org/wiki/Property_list) files in Objective-C.

It is used in the apps written by [Mostly Disco](http://www.mostlydisco.com) and [The Frontier Group](http://www.thefrontiergroup.com.au)

## Installation

Copy `DKPropertyList.h` and `DKPropertyList.m` into to your project folder, and add them to your Xcode project.

## Usage

### Setup

The first step in using `DKPropertyList` is to subclass it. Here is an
example:

```objective-c
#import "DKPropertyList.h"

@interface ExamplePropertyList : DKPropertyList

@property (nonatomic, retain) NSString * someProperty;

@end
```

Now that we have subclassed it, when we save any of the properties on
the Property List, they will be written to a file called
"ExamplePropertyList.plist" in the current users documents directory.

When ever you initialize an instance of `DKPropertyList` it will load
all the values from the property list. If one does not exist, one will
be created.

### Accessing Properties

There are 2 ways to access properties of your plist

```objective-c
ExamplePropertyList * examplePropertyList = [ExamplePropertyList new];

NSString * property = examplePropertyList.someProperty;

NSLog(@"%@", property);
```

```objective-c
NSString * property = [ExamplePropertyList valueForProperty:@"someProperty"]

NSLog(@"%@", property);
```

### Saving Properties

Just like accessing properties, there are also 2 ways to save properties

```objective-c
ExamplePropertyList * examplePropertyList = [ExamplePropertyList new];

// Set the property
examplePropertyList.someProperty = @"More energy...";

// Save the property list
[examplePropertyList save];
```

```objective-c
[ExamplePropertyList setValue:@"More energy..." forProperty:@"someProperty"];
```

### Resetting your Property List

If you want to set all the values in your property list to `nil`

```objective-c
[examplePropertyList reset];
[examplePropertyList save];
```

### Reloading your Property List

If you want to reload your property list from the file system

```objective-c
[examplePropertyList reload];
```

## Running Specs

To run the specs, open [DKPropertyList.xcodeproj](https://github.com/keithpitt/DKPropertyList/tree/master/DKPropertyList.xcodeproj) project, and run the `Specs` target.

## Libraries Used

* https://github.com/petejkim/expecta
* https://github.com/pivotal/cedar
* http://ocmock.org/

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Send me a pull request. Bonus points for topic branches.

## Contributers

* [Keith Pitt](http://www.keithpitt.com)
* [The Frontier Group](http://www.thefrontiergroup.com.au)
* [Mostly Disco](http://www.mostlydisco.com)

## License

DKPropertyList is licensed under the MIT License:

  Copyright (c) 2011 Keith Pitt (http://www.keithpitt.com/)

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
