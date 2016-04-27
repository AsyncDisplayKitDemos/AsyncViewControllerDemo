//
//  DetailCellNode.h
//  AsyncViewControllerDemo
//
//  Created by Andrew on 16/4/27.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@class ASNetworkImageNode;

@interface DetailCellNode : ASCellNode
@property (nonatomic)NSInteger row;
@property (nonatomic,strong)NSString *imageCategory;

@property (nonatomic,strong)ASTextNode *nameNode;
/**
 *  异步调用图片的Node
 */
@property (nonatomic,strong)ASNetworkImageNode *imageNode;
@end
