//
//  CZProvince.m
//  04-城市选择
//
//  Created by apple on 15/5/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZProvince.h"

@implementation CZProvince

+(instancetype)provinceWithDict:(NSDictionary *)dict{
    CZProvince * pro = [[self alloc]init];
    [pro setValuesForKeysWithDictionary:dict];
    return  pro;
}

@end
