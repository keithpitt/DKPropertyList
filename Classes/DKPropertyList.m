//
//  DKPropertyList.m
//  DiscoKit
//
//  Created by Keith Pitt on 12/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "DKPropertyList.h"
#import "objc/runtime.h"

@implementation DKPropertyList

- (id)init {
	
	if ((self = [super init])) {

		// Figure out the ~/Documents folder for the iPhone. We can only write stuff here.
		NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
		_plistPath = [rootPath stringByAppendingString:@"/UserProperties.plist"];
        [_plistPath retain];
		
		// If the plist doesn't exist, copy the bundled one with app the to ~/Documents
		// directory (so we can write back to it).
		if (![[NSFileManager defaultManager] fileExistsAtPath:_plistPath]) {
			
			NSString *bundled = [[NSBundle mainBundle] pathForResource:@"UserProperties" ofType:@"plist"];
            
            // If we have a bundled version?
            if(bundled) {
                NSLog(@"%@", bundled);
                
                NSError *error = nil;
                [[NSFileManager defaultManager] copyItemAtPath:bundled toPath: _plistPath error:&error];
                
                // TODO: Do something with the error, possibly.
            } else {
                
                // Create an empty file
                NSDictionary *blankDictionary = [NSDictionary dictionary];
                [blankDictionary writeToFile:_plistPath atomically:YES];
                
            }
			
        }
		
		// Extract the data into a dictionary.
		NSMutableDictionary *temp = [[NSMutableDictionary alloc] initWithContentsOfFile: _plistPath];
        
        // Load the properties of the class into an array
        NSMutableArray *collection = [NSMutableArray array];
        
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        
        for (i = 0; i < outCount; i++) {        
            objc_property_t property = properties[i];
            [collection addObject:[NSString stringWithCString:property_getName(property)
                                                     encoding:NSASCIIStringEncoding]];
        }
        
        _properties = collection;
        [_properties retain];
		
		// Load them into the current class
        [self loadFromDictionary:temp];
        
		[temp release];
		
	}
	
	return self;
	
}

- (void)save {
	
	// Extract the data into a dictionary.
	NSMutableDictionary *temp = [[NSMutableDictionary alloc] initWithContentsOfFile: _plistPath];
	
	[self saveToDictionary:temp];
	
	// Save that shit.
	[temp writeToFile:_plistPath atomically:YES];
	
	// Cleanup
	[temp release];
	
}

- (void)loadFromDictionary:(NSMutableDictionary*)dict {
    
    // Load values from the dictionary
    for (NSString *property in _properties)
        [self setValue:[dict objectForKey:property] forKey:property];
    
}

- (void)saveToDictionary:(NSMutableDictionary*)dict {
    
    // Re-set it back to the dictionary.
    for (NSString *property in _properties) {
        id value = [self valueForKey:property];
        if (value)
            [dict setObject:value forKey:property];
    }
    
}

- (void)dealloc {

    // Cleanup
    for (NSString *property in _properties)
        [self setValue:nil forKey:property];
    
    [_properties release];
    [_plistPath release];
    
    [super dealloc];
    
}

@end