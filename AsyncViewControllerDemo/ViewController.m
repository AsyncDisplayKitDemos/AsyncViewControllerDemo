//
//  ViewController.m
//  AsyncViewControllerDemo
//
//  Created by Andrew on 16/4/27.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "DetailRootNode.h"
#import "DetailViewController.h"

@interface ViewController ()<ASTableDataSource, ASTableDelegate>
@property (nonatomic,strong)NSArray *imageCategories;
@property (nonatomic,strong,readonly)ASTableNode *tableNode;

@end

@implementation ViewController

-(instancetype)init{
    self=[super init];
    if(self){
    _imageCategories = @[@"abstract", @"animals", @"business", @"cats", @"city", @"food", @"nightlife", @"fashion", @"people", @"nature", @"sports", @"technics", @"transport"];
    }
    return self;
}

-(void)dealloc{
    self.tableNode.dataSource=nil;
    self.tableNode.delegate=nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"Image Categories";
    
    self.tableNode.delegate=self;
    self.tableNode.dataSource=self;
    
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableNode.view deselectRowAtIndexPath:self.tableNode.view.indexPathForSelectedRow animated:YES];
}


#pragma mark - getter / setter
-(ASTableNode *)tableNode{
    return (ASTableNode *)self.node;
}

#pragma mark  - ASTableDataSource / ASTableDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imageCategories.count;
}

-(ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *imageCategory = self.imageCategories[indexPath.row];

    return ^{
        ASTextCellNode *textCellNode = [ASTextCellNode new];
        textCellNode.text=[imageCategory capitalizedString];
        return textCellNode;
    };
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   NSString *imageCategory = self.imageCategories[indexPath.row];
    DetailRootNode *detailRootNode = [[DetailRootNode alloc]initWithImageCategory:imageCategory];
    
    DetailViewController *detailVc=[[DetailViewController alloc]initWithNode:detailRootNode];
    detailVc.title=[imageCategory capitalizedString];
    [self.navigationController pushViewController:detailVc animated:YES];
}


@end
