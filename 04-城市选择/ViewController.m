//
//  ViewController.m
//  04-城市选择
//
//  Created by apple on 15/5/9.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZProvince.h"

@interface ViewController () <UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,strong)NSArray *provinces;
@property(nonatomic,assign)NSInteger lastSelectIndex;
@end

@implementation ViewController

//懒加载
-(NSArray *)provinces{
    if (_provinces == nil) {
        // 解析
        NSString * path = [[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"];
       NSArray * tempArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * array = [NSMutableArray array];
        // 遍历plist里面的字典
        for (NSDictionary * dict in tempArray) {
            // 字典-》模型
            CZProvince * pro = [CZProvince provinceWithDict:dict];
            [array addObject:pro];
        }
        _provinces = array;
    }
    return _provinces;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // pickerView 默认有宽高
    UIPickerView * pickerView = [[UIPickerView alloc]init];
    // 设置代理和数据源
    pickerView.delegate = self;
    pickerView.dataSource=self;
    
    [self.view addSubview:pickerView];
}

// 返回多少组
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// component组有多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0){
        return  self.provinces.count;
    } else {
        // 省份的位置
        NSInteger provinceIndex = [pickerView selectedRowInComponent:0];
        // 根据省份的位置得到city的count
        return [[self.provinces[provinceIndex] cities] count];
        
    }
}

// pickerView 显示的文字内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSLog(@"titleForRow");
    if (component == 0) {
        return  [self.provinces[row] name];
    } else {
//          NSInteger provinceIndex = [pickerView selectedRowInComponent:0];
        // 上一次选择省份的下标
        NSInteger provinceIndex = self.lastSelectIndex;
        
        return [self.provinces[provinceIndex] cities][row];
    }
    return  @"";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component ==0) {
        // 刷新全部列
//        [pickerView reloadAllComponents];
        // 刷新指定的列
        [pickerView reloadComponent:1];
        self.lastSelectIndex = row;
    }
}
@end
