//
//  LZW_FilterModelProtocol.h
//  NSArrayModelFilter
//
//  Created by 刘志伟 on 2017/3/7.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LZW_FilterModelProtocol <NSObject>

@required

//是否是同一个
- (BOOL)isTheSameOneAs:(id<LZW_FilterModelProtocol>)object;

//返回唯一标识
- (NSString *)uniqueIdentifier;

@end
