//
//  KVOViewController.m
//  iOSObserving
//
//  Created by jashion on 16/4/12.
//  Copyright © 2016年 BMu. All rights reserved.
//

#import "KVOViewController.h"
#import "Car.h"

@interface KVOViewController ()
@property (strong, nonatomic) IBOutlet UILabel *showCarDetail;

@end

@implementation KVOViewController
{
    Car *car;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //应该在监听者里添加监听，而不是在被监听者里添加监听
    //在被监听者添加监听会造成循环引用的问题
    car = [[Car alloc] init];
    [car addObserver: self forKeyPath: @"carPaint" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: nil];
    self.showCarDetail.text = [NSString stringWithFormat: @"车的颜色是%@", car.carPaint];
}

- (IBAction)changeCarDetail:(id)sender {
    [car setValue: @"蓝色" forKey: @"carPaint"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString: @"carPaint"]) {
        NSLog(@"%@", [change objectForKey: @"new"]);    //修改之后的值
        self.showCarDetail.text = [NSString stringWithFormat: @"车的颜色是%@", [change objectForKey: @"new"]];
    }
}

- (void)dealloc {
    //监听者应该是self，被监听者是car
    [car removeObserver: self forKeyPath: @"carPaint"];
}

@end
