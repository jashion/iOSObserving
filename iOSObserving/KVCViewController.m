//
//  KVCViewController.m
//  iOSObserving
//
//  Created by jashion on 16/4/12.
//  Copyright © 2016年 BMu. All rights reserved.
//

#import "KVCViewController.h"
#import "Car.h"

@interface KVCViewController ()

@property (strong, nonatomic) IBOutlet UILabel *showCarDetail;
@end

@implementation KVCViewController
{
    Car *car;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    car = [[Car alloc] init];
    self.showCarDetail.text = [self showCarDetail: car];
}

- (IBAction)changeCarDetail:(id)sender {
    //1.setValue: forKey
    [car setValue: @"奔驰" forKey: @"name"];
    [car setValue: [NSNumber numberWithFloat: 80] forKey: @"speed"];
    [car setValue: @"黑色" forKey: @"carPaint"];
    
    //2.setValue:forKeyPath
    [car setValue: [NSNumber numberWithFloat: 40] forKeyPath: @"engine.horsepower"];
    self.showCarDetail.text = [self showCarDetail: car];
}

- (NSString *)showCarDetail: (Car *)currentCar {
    //1.valueForKey
    NSString *name = [currentCar valueForKey: @"name"];
    NSNumber *speed = [currentCar valueForKey: @"speed"];
    NSString *carPaint = [currentCar valueForKey: @"carPaint"];
    
    //2.valueForKeyPath
    NSNumber *horsepower = [currentCar valueForKeyPath: @"engine.horsepower"];
    
    //3.整体操作:访问数组，如果使用某个键值来访问一个NSArray数组，它实际上会查询相应数组中的每个对象，然后将查询结果大包到另一个数组并返回，但是不能直接在建路径中索引这些数组，如：tires[0].pressure
    NSArray *pressures = [currentCar valueForKeyPath: @"tires.pressure"];
    NSLog(@"%@", pressures);
    
    //4.快速运算@count,@sum,@avg,@min,@max,@distinctUnionOfObjects
    NSNumber *count = [currentCar valueForKeyPath: @"tires.@count"];    //对左边键值返回数组操作，获取数组数量
    NSNumber *sum = [currentCar valueForKeyPath: @"tires.@sum.pressure"];    //对左边键值返回数组操作，获取每个数组里面的pressure值，求和
    NSNumber *avg = [currentCar valueForKeyPath: @"tires.@avg.pressure"];    //对左边键值返回数组操作，获取每个数组里面的pressure值，求平均值
    NSNumber *min = [currentCar valueForKeyPath: @"tires.@min.pressure"];    //对左边键值返回数组操作，获取每个数组里面的pressure值，找出最小值
    NSNumber *max = [currentCar valueForKeyPath: @"tires.@max.pressure"];    //对左边键值返回数组操作，获取每个数组里面的pressure值，找出最大值
    NSArray *tireType = [currentCar valueForKeyPath: @"tires.@distinctUnionOfObjects.pressure"];    //对左边键值返回数组操作，获取每个数组里面的pressure值，去掉重复的值，返回一个包含所有不重复值的数组
    NSLog(@"TiresCount: %@ Sum: %@, Avg: %@, Min: %@, Max: %@, TireType: %@", count, sum, avg, min, max, tireType);
    
    //5.批处理
    //字典里面不能为nil，如果返回值有nil，则KVC会自己处理，将返回[NSNull null]表示nil
    //<null>和(null)的区别：前者是[NSNull null]对象，而后者是正真的nil。
    NSArray *keys = [NSArray arrayWithObjects: @"make", @"modelYear", @"numberOfDoors", nil];
    NSDictionary *carValues = [currentCar dictionaryWithValuesForKeys: keys];
    NSLog(@"%@", carValues);
    
    //6.nil处理
    //可以自己运行一下，重写和没有重写setNilValueForKey:方法的代码
    [currentCar setValue: nil forKey: @"speed"];
    NSLog(@"carSpeed: %@", [currentCar valueForKey: @"speed"]);
    
    //7.处理未定义的值
    [currentCar setValue: [NSNumber numberWithFloat: 1500] forKey: @"mileage"];
    [currentCar setValue: [NSNull null] forKey: @"price"];
    [currentCar setValue: nil forKey: @"capacity"];
    NSLog(@"Mileage: %@ Price: %@, Capacity: %@", [currentCar valueForKey: @"mileage"], [currentCar valueForKey: @"price"], [currentCar valueForKey: @"capacity"]);
        
    NSString *des = [NSString stringWithFormat: @"%@ %@ 时速%.1f 马力为%.1f", carPaint, name, [speed floatValue], [horsepower floatValue]];
    return des;
}

@end
