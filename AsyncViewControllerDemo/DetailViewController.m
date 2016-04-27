//
//  DetailViewController.m
//  AsyncViewControllerDemo
//
//  Created by Andrew on 16/4/27.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "DetailViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

#import "DetailRootNode.h"

@implementation DetailViewController
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [self.node.collectionNode.view.collectionViewLayout invalidateLayout];
}
@end
