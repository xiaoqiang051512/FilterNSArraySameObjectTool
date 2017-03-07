//
//  NSArray+LZW_ModelFilter.m
//  NSArrayModelFilter
//
//  Created by 刘志伟 on 2017/3/7.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "NSArray+LZW_ModelFilter.h"
#import "LZW_FilterModelProtocol.h"


@implementation NSArray (LZW_ModelFilter)

- (NSArray *)filterByBaseArray:(NSArray *)baseArray{
    
    NSMutableArray *filterArray = [NSMutableArray arrayWithArray:[self filterSameObjects]];
    NSMutableArray *sameArray = [NSMutableArray array];
    
    [baseArray enumerateObjectsUsingBlock:^(id<LZW_FilterModelProtocol>baseModel, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [self enumerateObjectsUsingBlock:^(id<LZW_FilterModelProtocol>compareModel, NSUInteger idx, BOOL * _Nonnull stop) {
        
            if ([compareModel respondsToSelector:@selector(isTheSameOneAs:)]) {
                
                if ([[baseModel uniqueIdentifier] isEqualToString:[compareModel uniqueIdentifier]]) {
                    
                    [sameArray addObject:compareModel];
                }
            }
        }];
        
    }];
    
    [filterArray removeObjectsInArray:sameArray];
    
    return filterArray;
}

- (NSArray *)addAndFilterObjectsFromArray:(NSArray *)addArray{
    
    NSArray *filterArray = [addArray filterByBaseArray:self];
    NSMutableArray *finalArray = [NSMutableArray arrayWithArray:[self filterSameObjects]];
    
    [finalArray addObjectsFromArray:filterArray];
    
    return finalArray;
}

- (NSArray *)insertFilterObjectsFromArray:(NSArray *)insetArray{
    
    NSArray *filterArray = [insetArray filterByBaseArray:self];
    NSMutableArray *finalArray = [NSMutableArray arrayWithArray:[self filterSameObjects]];
    
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    for (int i = 0; i < filterArray.count; i++) {
        
        [set addIndex:i];
    }
    
    [finalArray insertObjects:filterArray atIndexes:set];
        
    return finalArray;
}

//过滤数组中相同的元素
- (NSArray *)filterSameObjects{
    
    NSMutableArray *filterArray = [NSMutableArray array];
    NSMutableArray *filterUniqueIDArray = [NSMutableArray array];
    
    for (id<LZW_FilterModelProtocol>object in self) {
        
        if ([filterUniqueIDArray containsObject:[object uniqueIdentifier]]) {
            continue;
        }
        
        [filterUniqueIDArray addObject:[object uniqueIdentifier]];
        [filterArray addObject:object];
    }
    
    return filterArray;
}

@end
