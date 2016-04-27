//
//  DetailRootNode.h
//  AsyncViewControllerDemo
//
//  Created by Andrew on 16/4/27.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@class ASCollectionNode;

@interface DetailRootNode : ASDisplayNode

@property (nonatomic,strong,readonly)ASCollectionNode *collectionNode;

-(instancetype)initWithImageCategory:(NSString*)imageCategory;

@end
