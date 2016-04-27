//
//  DetailCellNode.m
//  AsyncViewControllerDemo
//
//  Created by Andrew on 16/4/27.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "DetailCellNode.h"

@implementation DetailCellNode
-(instancetype)init{
    self=[super init];
    if(self){
        _imageNode=[[ASNetworkImageNode alloc]init];
        _imageNode.backgroundColor=ASDisplayNodeDefaultPlaceholderColor();
        [self addSubnode:_imageNode];
    
    }
    return self;
}
#pragma mark  - ASDisplayNode
/**
 *  布局代码
 *
 *  @param constrainedSize 约束尺寸
 *
 *  @return 自动计算的尺寸
 */
-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    self.imageNode.position=CGPointZero;
    self.imageNode.sizeRange=ASRelativeSizeRangeMakeWithExactCGSize(constrainedSize.max);
    return [ASStaticLayoutSpec staticLayoutSpecWithChildren:@[self.imageNode]];
}


-(void)layoutDidFinish{
    [super layoutDidFinish];
    
    self.imageNode.URL=[self imageURL];
}

#pragma mark - Image
-(NSURL *)imageURL{
    CGSize imageSize = self.calculatedSize;
     NSString *imageURLString = [NSString stringWithFormat:@"http://lorempixel.com/%ld/%ld/%@/%ld", (long)imageSize.width, (long)imageSize.height, self.imageCategory, (long)self.row];
    return [NSURL URLWithString:imageURLString];
}

@end





