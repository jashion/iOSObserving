//
//  Tire.m
//  iOSObserving
//
//  Created by jashion on 16/4/13.
//  Copyright © 2016年 BMu. All rights reserved.
//

#import "Tire.h"

@implementation Tire

- (instancetype)init {
    if (self = [self initWithPressure: 34]) {
        
    }
    return self;
}

- (instancetype)initWithPressure:(float)p {
    if (self = [super init]) {
        _pressure = p;
    }
    return self;
}

@end
