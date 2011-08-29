//
//  DKPropertyListSpec.m
//  DKPropertyList
//
//  Created by Keith Pitt on 29/08/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "DKPropertyList.h"

#import "SpecHelper.h"
#import "ExamplePropertyList.h"

SPEC_BEGIN(DKPropertyListSpec)

ExamplePropertyList * examplePropertyList = [ExamplePropertyList new];

context(@"+ (NSString *)propertyListFileName", ^{
   
    it(@"should return the name of the class", ^{
        
        expect([ExamplePropertyList performSelector:@selector(propertyListFileName)]).toEqual(@"ExamplePropertyList");
        
    });
    
});

context(@"+ (void)setValue:(id)value forProperty:(NSString *)property", ^{
    
    it(@"should set the property", ^{
        
        [ExamplePropertyList setValue:@"Hello There!" forProperty:@"string"];
        
        [examplePropertyList reload];
        
        expect(examplePropertyList.string).toEqual(@"Hello There!");
        
    });
    
});

context(@"+ (void)valueForProperty:(NSString *)property", ^{
    
    it(@"should get the property", ^{
        
        [ExamplePropertyList setValue:@"Ruuut!" forProperty:@"string"];
        
        NSString * result = [ExamplePropertyList valueForProperty:@"string"];
        
        expect(result).toEqual(@"Ruuut!");
        
    });
    
});

context(@"- (void)save", ^{
    
    it(@"should save values back to the PList", ^{
        
        examplePropertyList.string = @"Foo";
        examplePropertyList.number = [NSNumber numberWithInt:12];
        examplePropertyList.dictionary = [NSDictionary dictionaryWithObject:@"More Energy" forKey:@"Arnie"];
        examplePropertyList.array = [NSArray arrayWithObjects:@"Up", @"Down", nil];
        
        [examplePropertyList save];
        
        ExamplePropertyList * reloadedExamplePropertyList = [ExamplePropertyList new];
        
        expect(reloadedExamplePropertyList.string).toEqual(examplePropertyList.string);
        expect(reloadedExamplePropertyList.number).toEqual(examplePropertyList.number);
        expect(reloadedExamplePropertyList.dictionary).toEqual(examplePropertyList.dictionary);
        expect(reloadedExamplePropertyList.array).toEqual(examplePropertyList.array);
        
    });
    
});

SPEC_END