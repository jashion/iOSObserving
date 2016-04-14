//
//  Car.m
//  iOSObserving
//
//  Created by jashion on 16/4/12.
//  Copyright © 2016年 BMu. All rights reserved.
//

#import "Car.h"
#import "Tire.h"
#import "Engine.h"

@implementation Car
{
    Tire *tire;
}

- (instancetype)init {
    if (self = [super init]) {
        [self inital];
    }
    return self;
}

- (void)inital {
    _name = @"宝马";
    _speed = 120;
    _carPaint = @"红色";
    _engine = [[Engine alloc] init];
    _tires = [@[] mutableCopy];
    for (NSInteger i = 0; i < 4; i++) {
        tire = [[Tire alloc] init];
        tire.pressure = 20 + i % 2 * 2;
        [_tires addObject: tire];
    }
    //        _make = @"BMW";
    _modelYear = 1991;
    _numberOfDoors = 4;
}

//解决设置为nil的问题
- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString: @"speed"]) {
        _speed = 0;
    } else {
        [super setNilValueForKey: key];    //防止使用了我们不能理解的建
    }
}

//处理未定义的建
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if (self.stuff == nil) {
        self.stuff = [[NSMutableDictionary alloc] init];
    }
    [self.stuff setValue: value forKey: key];
}

- (id)valueForUndefinedKey:(NSString *)key {
    //对象为NSDictionary中setObject:forKey和setValue:forKey的区别：传入nil值，前者会给出警告信息，后者会把对应建的key删除
    id value = [_stuff valueForKey: key];    //没有值返回nil
    return value;
    return nil;
}

@end
