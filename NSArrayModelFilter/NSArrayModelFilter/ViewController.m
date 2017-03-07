//
//  ViewController.m
//  NSArrayModelFilter
//
//  Created by 刘志伟 on 2017/3/7.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"
#import "NSArray+LZW_ModelFilter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arr1 = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        
        StudentModel *model = [[StudentModel alloc] init];
        
        model.userId = i;
        model.name = [NSString stringWithFormat:@"xiaoqiang%d",i];
        
        [arr1 addObject:model];
    }
    
    NSMutableArray *arr2 = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        
        StudentModel *model = [[StudentModel alloc] init];
        
        model.userId = i;
        model.name = [NSString stringWithFormat:@"xiaoqiang%d",i];
        
        [arr2 addObject:model];
    }

    arr1 = (NSMutableArray *)[arr1 addAndFilterObjectsFromArray:arr2];
    
    NSLog(@"%@",arr1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
