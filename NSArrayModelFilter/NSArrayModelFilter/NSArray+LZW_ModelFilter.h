//
//  NSArray+LZW_ModelFilter.h
//  NSArrayModelFilter
//
//  Created by 刘志伟 on 2017/3/7.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LZW_ModelFilter)


/**
 过滤数组中相同的元素

 @param baseArray 用来过滤的原始数组
 @return 返回过滤后的数组
 */
- (NSArray *)filterByBaseArray:(NSArray *)baseArray;

/**
 从后增加过滤后的数组

 @param addArray 原始未过滤的数组
 @return 返回过滤后并增加后的数组
 */
- (NSArray *)addAndFilterObjectsFromArray:(NSArray *)addArray;


/**
 从前插入过滤后的数组

 @param insetArray 插入的原始数组
 @return 返回过滤后并插入前 的数组
 */
- (NSArray *)insertFilterObjectsFromArray:(NSArray *)insetArray;

@end
