//
//  LeftVC.h
//  SDLeftSliderDemo
//
//  Created by sundan on 17/3/10.
//  Copyright © 2017年 lzt. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FatherViewController.h"

typedef void (^leftVCBlock) (NSInteger selectedIndex);

@interface LeftVC : FatherViewController

@property (nonatomic ,copy  )   leftVCBlock  block;

@end
