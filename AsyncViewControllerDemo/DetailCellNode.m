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
        
        
        _nameNode=[[ASTextNode alloc]init];
        _nameNode.backgroundColor=[UIColor redColor];
        [self addSubnode:_nameNode];
    
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
    
    self.nameNode.position=CGPointMake(10, 40);
    self.nameNode.sizeRange=ASRelativeSizeRangeMakeWithExactCGSize(CGSizeMake(100, 20));
    return [ASStaticLayoutSpec staticLayoutSpecWithChildren:@[self.imageNode,self.nameNode]];
}


-(void)layoutDidFinish{
    [super layoutDidFinish];
    
    self.imageNode.URL=[self imageURL];
    
    NSString *title=[NSString stringWithFormat:@"Hello Async %d",_row];
    self.nameNode.attributedString = [self getAttributes:title];
}

#pragma mark - Image
-(NSURL *)imageURL{
    CGSize imageSize = self.calculatedSize;
     NSString *imageURLString = [NSString stringWithFormat:@"http://lorempixel.com/%ld/%ld/%@/%ld", (long)imageSize.width, (long)imageSize.height, self.imageCategory, (long)self.row];
    return [NSURL URLWithString:imageURLString];
}

-(NSAttributedString *)getAttributes:(NSString *)title{
    
    NSDictionary *dict=@{NSFontAttributeName:[UIFont systemFontOfSize:14],
                         NSForegroundColorAttributeName:[UIColor blueColor]};
    return [[NSAttributedString alloc]initWithString:title attributes:dict];
}

@end





