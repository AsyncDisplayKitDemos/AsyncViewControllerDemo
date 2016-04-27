# AsyncViewControllerDemo
在ViewController中分别展示了tableNode和ASCollectionNode的用法

##用例图片
![1](http://7xsn4e.com2.z0.glb.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B44%E6%9C%8827%E6%97%A5%20%E4%B8%8B%E5%8D%883.16.37.png)

![2](http://7xsn4e.com2.z0.glb.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B44%E6%9C%8827%E6%97%A5%20%E4%B8%8B%E5%8D%883.17.04.png)

![3](http://7xsn4e.com2.z0.glb.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B44%E6%9C%8827%E6%97%A5%20%E4%B8%8B%E5%8D%883.16.47.png)


##在ViewConroller中显示TableNode


```
@interface ViewController : ASViewController<ASTableNode *>

@end
```

在初始化的方法中，必须调用父类的`initWithNode`方法，这是必须的。

```
 -(instancetype)init{
    self=[super initWithNode:[ASTableNode new]];
    if(self){
    _imageCategories = @[@"abstract", @"animals", @"business", @"cats", @"city", @"food", @"nightlife", @"fashion", @"people", @"nature", @"sports", @"technics", @"transport"];
    }
    return self;
}
```

然后在表格的每行点击方法中，跳转到`DetailViewController`控制器中。

##DetailViewController控制器

```
@interface DetailViewController : ASViewController<DetailRootNode *>

@end
```

它也是继承ASViewController，并且多继承了DetailRootNode。

DetailRootNode是真正实现了ASCollection的载体，它实现了ASCollectionNode的代理方法

##DetailRootNode

```
@interface DetailRootNode : ASDisplayNode

@property (nonatomic,strong,readonly)ASCollectionNode *collectionNode;

-(instancetype)initWithImageCategory:(NSString*)imageCategory;

@end
```

这个Node主要实现ASCollectionNode的代理方法，其中必须实现的是对ASCollectionNode进行布局，布局代码必须实现，如下:

```
#pragma mark - ASDisplayNode
-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    self.collectionNode.position=CGPointZero;
    self.collectionNode.sizeRange=ASRelativeSizeRangeMakeWithExactCGSize(constrainedSize.max);
    
    return [ASStaticLayoutSpec staticLayoutSpecWithChildren:@[self.collectionNode]];
}
```


##DetailCellNode
每个ASColletionNode的每个表格返回的对象，这个也是自定义的
继承自ASCellNode

```
@interface DetailCellNode : ASCellNode
```
里面封装了图片node和文本node,用来在cell中显示。