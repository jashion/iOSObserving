//
//  Tire.h
//  iOSObserving
//
//  Created by jashion on 16/4/13.
//  Copyright © 2016年 BMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject

@property (nonatomic, assign) float pressure;

- (instancetype)initWithPressure: (float)p;

@end
