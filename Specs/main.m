//
//  main.m
//  Specs
//
//  Created by Keith Pitt on 19/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Cedar-iPhone/Cedar.h>

int main(int argc, char *argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    int retVal = UIApplicationMain(argc, argv, nil, @"CedarApplicationDelegate");
    [pool release];
    return retVal;
}