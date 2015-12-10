//
//  CZProvince.h
//  04-城市选择
//
//  Created by apple on 15/5/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZProvince : NSObject

// javabean
// bean
// 实体类

@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSArray *cities;

+(instancetype)provinceWithDict:(NSDictionary *)dict;

@end
