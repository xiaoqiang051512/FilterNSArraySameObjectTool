//
//  LZW_Object.m
//  NSArrayModelFilter
//
//  Created by 刘志伟 on 2017/3/7.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "LZW_Object.h"

@implementation LZW_Object

//判断是否是同一个元素
- (BOOL)isTheSameOneAs:(id<LZW_FilterModelProtocol>)object{
    
    if ([[self uniqueIdentifier] isEqualToString:[object uniqueIdentifier]]) {
        
        return YES;
    }else{
        
        return NO;
    }
}

//返回元素标识符
- (NSString *)uniqueIdentifier{
    
    return self.description;
}

@end
