//
//  ExamplePropertyList.h
//  DKPropertyList
//
//  Created by Keith Pitt on 29/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DKPropertyList.h"

@interface ExamplePropertyList : DKPropertyList

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * string;
@property (nonatomic, retain) NSString * dictionary;
@property (nonatomic, retain) NSArray * array;

@end