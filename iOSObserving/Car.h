//
//  Car.h
//  iOSObserving
//
//  Created by jashion on 16/4/12.
//  Copyright © 2016年 BMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tire;
@class Engine;
@class KVOViewController;

@interface Car : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) float speed;
@property (nonatomic, copy) NSString *carPaint;
@property (nonatomic) Engine *engine;
@property (nonatomic) NSMutableArray *tires;    //车胎

@property (nonatomic, copy) NSString *make;
@property (nonatomic, assign) int modelYear;
@property (nonatomic, assign) int numberOfDoors;

@property (nonatomic, strong) NSMutableDictionary *stuff;

- (instancetype)initWithKVO: (KVOViewController *)kvo;

@end
