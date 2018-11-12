# ZFCChainedCreater
ZFCChainedCreater的使用
=
这是一个将UI的创建转成链式调用，包含UIView、UILabel、UIImageView、UIButton、UITextField、UITextView、UITableView、UICollectionView这些常用控件的创建；还可以将tableView、collectionView的使用转成链式调用，不用再每次写复杂的代理；而且还支持复杂tableView的抽离，使用起来不仅方便简洁，代码可维护性大大提高。
# 1. 导入方式：
1.1 直接将ZFCChainedCreater这个文件拖入工程直接使用<br>
1.2 通过cocoapod导入 pod 'ZFCChainedCreater', '~> 1.0.2'

# 2. 基本使用如下：
## 2.1 常用控件链式创建
```
    //view
    UIView *chainedView = [UIView ZFC_ViewChainedCreater:^(ZFC_ViewChainedCreater *creater) {
    creater.backgroundColor([UIColor cyanColor])
        .frame(CGRectMake(getCenterX(100), 100, 100, 40))
        .tag(1)
        .isUserTapTapGesture(YES)
        .addIntoView(self.view)
        .layerCornerRadius(5)
        .tapBlock(^(UIView *view) {
        NSLog(@"-------点击了view--------");
        });
    }];

    //label
    UILabel *label = [UILabel ZFC_LabelChainedCreater:^(ZFC_LabelChainedCreater *creater) {

        creater.backgroundColor([UIColor cyanColor])
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(chainedView.frame) + 20, 100, 40))
        .tag(2)
        .text(@"我是文字")
        .textColor([UIColor blackColor])
        .font([UIFont systemFontOfSize:15])
        .textAlignment(NSTextAlignmentCenter)
        .numberOfLines(1)
        .addIntoView(self.view)
        .layerCornerRadius(5)
        .tapBlock(^(UILabel *label) {
        NSLog(@"-------点击了label--------");
        });
    }];

    //imageView
    UIImageView *imageView = [UIImageView ZFC_ImageViewChainedCreater:^(ZFC_ImageViewChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(label.frame) + 20, 100, 40))
        .tag(2)
        .image([UIImage imageNamed:@"test.jpg"])
        .layerCornerRadius(5)
        .addIntoView(self.view)
        .tapBlock(^(UIImageView *imageView) {
        NSLog(@"-------点击了imageView--------");
        });
    }];

    //button
    UIButton *button = [UIButton ZFC_ButtonChainedCreater:^(ZFC_ButtonChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .tag(3)
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(imageView.frame) + 20, 100, 40))
        .titleLabelFont([UIFont systemFontOfSize:15])
        .title(@"未选中按钮", UIControlStateNormal)
        .title(@"未选中按钮", UIControlStateSelected)
        .titleColor([UIColor lightGrayColor], UIControlStateNormal)
        .titleColor([UIColor redColor], UIControlStateSelected)
        .layerCornerRadius(5)
        .layerBorderWidthAndBorderColor(1, [UIColor blueColor])
        .addIntoView(self.view)
        .actionBlock(^(UIButton *button) {
        button.selected = !button.selected;
        NSLog(@"-------点击了button--------");
        });
    }];

    //textField
    UITextField *textField = [UITextField ZFC_TextFieldChainedCreater:^(ZFC_TextFieldChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .tag(4)
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(button.frame) + 20, 200, 40))
        .placeholder(@"请输入文字...")
        .font([UIFont systemFontOfSize:15])
        .keyboardType(UIKeyboardTypeDefault)
        .clearButtonMode(YES)
        .layerBorderWidthAndBorderColor(1, [UIColor blackColor])
        .layerCornerRadius(5)
        .addIntoView(self.view);
    }];

    //textView
    [UITextView ZFC_TextViewChainedCreater:^(ZFC_TextViewChainedCreater *creater) {
        creater.backgroundColor([UIColor cyanColor])
        .tag(5)
        .placeholder(@"请输入文字...")
        .font([UIFont systemFontOfSize:15])
        .layerBorderWidthAndBorderColor(1,  [UIColor blackColor])
        .frame(CGRectMake(getCenterX(100), CGRectGetMaxY(textField.frame) + 20, 200, 100))
        .addIntoView(self.view);
    }];

    //tableView
    self.tableView = [UITableView ZFC_TableViewChainedCreater:^(ZFC_TableViewChainedCreater *creater) {
        creater.frameAndStyle(self.view.bounds, UITableViewStylePlain)
        .backgroundColor([UIColor whiteColor])
        .tag(1)
        .separatorStyleAndColor(UITableViewCellSeparatorStyleSingleLine, [UIColor blueColor])
        .separatorInset(UIEdgeInsetsMake(0, 30, 0, 30))
        .rowHeight(60)
        .sectionFooterHeight(40)
        .sectionFooterHeight(30)
        .tableHeaderView(headerView)
        .tableFooterView(footerView)
        .addIntoView(self.view) ;
    }];

    //collectionView
    self.collectionView = [UICollectionView ZFC_CollectionViewChainedCreater:^(ZFC_CollectionChainedCreater *creater) {
        creater.layout_minimumLineSpacing(10)
        .layout_minimumInteritemSpacing(15)
        .layout_itemSize(CGSizeMake(100, 100))
        .layout_headerReferenceSize(CGSizeMake(50, 50))
        .layout_footerReferenceSize(CGSizeMake(50, 50))
        .layout_scrollDirection(UICollectionViewScrollDirectionVertical)
        .layout_sectionHeadersPinToVisibleBounds(YES)
        .layout_sectionHeadersPinToVisibleBounds(YES)
        .frame(self.view.bounds)
        .tag(2)
        .backgroundColor([UIColor whiteColor])
        .addIntoView(self.view);
    }];
```


# 3. tableView/collectionView的链式调用
## 3.1 tableView的链式调用
```
    __block BOOL isXIB = YES;
    ZFC_TableViewConfig *tableViewConfig = [ZFC_TableViewConfig new];
    tableViewConfig.tableView = self.tableView;
    tableViewConfig.isCellXib = isXIB;
    tableViewConfig.cellClass = [getClassFromClassString(@"ZFC_TableViewCell", isXIB) class];
    tableViewConfig.isSectionHeaderXib = isXIB;
    tableViewConfig.sectionHeaderClass = [getClassFromClassString(@"ZFC_TableViewHeaderFooterView", isXIB) class];
    tableViewConfig.isSectionFooterXib = isXIB;
    tableViewConfig.sectionFooterClass = [getClassFromClassString(@"ZFC_TableViewHeaderFooterView", isXIB) class];
    tableViewConfig.canDelete = YES;
    __weak typeof(self)weakSelf = self;
    [self.tableView configure:^(ZFC_TableViewChainedInvokeCreater *creater) {

          creater.zfc_tableViewConfigure(tableViewConfig)

    .zfc_numberOfSectionsInTableView(^NSInteger(UITableView *tableView){
          return 3;
    })
    .zfc_numberOfRowsInSection(^NSInteger(UITableView *tableView,NSInteger section) {
          return strongSelf.dataSource.count; 
    })
    .zfc_heightForRowAtIndexPath(^CGFloat(UITableView *tableView,NSIndexPath *indexPath) {

         return 50;
    })
    .zfc_cellForRowAtIndexPath(^(UITableView *tableView,__kindof ZFC_TableViewCell *cell, NSIndexPath *indexPath) {

         cell.myLabel.text = [NSString stringWithFormat:@"%@%@",strongSelf.dataSource[indexPath.row],isXIB?@"->XIB":@""];

         cell.contentView.backgroundColor = [UIColor grayColor];

    })
    .zfc_heightForHeaderInSection(^CGFloat(UITableView *tableView,NSInteger section) {

         return 40;
    })
    .zfc_viewForHeaderInSection(^(UITableView *tableView,__kindof ZFC_TableViewHeaderFooterView *headerView,NSInteger section) {

          headerView.myLabel.text = [NSString stringWithFormat:@"我是第-- %ld --段头%@",section,isXIB?@"->XIB":@""];

          headerView.contentView.backgroundColor = [UIColor yellowColor];
    })
    .zfc_heightForFooterInSection(^CGFloat(UITableView *tableView,NSInteger section) {

          return 40;

    }).zfc_viewForFooterInSection(^(UITableView *tableView,__kindof ZFC_TableViewHeaderFooterView *footerView,NSInteger section) {

          footerView.myLabel.text = [NSString stringWithFormat:@"我是第-- %ld --段尾%@",section,isXIB?@"->XIB":@""];
          footerView.contentView.backgroundColor = [UIColor blueColor];

    })
    .zfc_deleteCellWithIndexPath(^(UITableView *tableView, NSIndexPath *indexPath) {
          NSLog(@"删除");
          [strongSelf.dataSource removeLastObject];
          [tableView reloadData];
    })
    .zfc_didSelectRowAtIndexPath(^(UITableView *tableView,NSIndexPath *indexPath) {
          NSLog(@"我点击了%@",strongSelf.dataSource[indexPath.row]);
    });
    }];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          for(NSInteger i = 2; i < 5; i++) {
               [self.dataSource addObject:[NSString stringWithFormat:@"测试:%ld",i]];
          }
          [self.tableView.creater zfc_reloadData];
    });
```
    

## 3.2 collectionView的链式调用
```
    __block BOOL isXIB = YES;
    collectionViewConfig.isCellXib = isXIB;
    collectionViewConfig.cellClass = [getClassFromClassString(@"ZFC_CollectionViewCell", isXIB) class];
    collectionViewConfig.isSectionHeaderXib = isXIB;
    collectionViewConfig.sectionHeaderClass = [getClassFromClassString(@"ZFC_CollectionHeaderFooterView", isXIB) class];
    collectionViewConfig.isSectionFooterXib = isXIB;
    collectionViewConfig.sectionFooterClass = [getClassFromClassString(@"ZFC_CollectionHeaderFooterView", isXIB) class];

    __weak typeof(self)weakSelf = self;
    [self.collectionView configure:^(ZFC_CollectionViewChainnedInvokeCreater *creater) {
    typeof(weakSelf)strongSelf = weakSelf;//此处一定要这么写
        creater.zfc_collectionViewConfigure(collectionViewConfig)

    .zfc_numberOfSectionsInCollectionView(^NSInteger(UICollectionView *collectionView){
        return 3;
    })
    .zfc_numberOfItemsInSection(^NSInteger(UICollectionView *collectionView,NSInteger section) {
        return strongSelf.dataSource.count;
    })
    .zfc_sizeForItemAtIndexPath(^CGSize(UICollectionView *collectionView,NSIndexPath *indexPath) {
         return CGSizeMake(115 , 100);
    })
    .zfc_cellForItemAtIndexPath(^(UICollectionView *collectionView,__kindof ZFC_CollectionViewCell *cell, NSIndexPath *indexPath) {

         cell.myLabel.text = [NSString stringWithFormat:@"%@%@",strongSelf.dataSource[indexPath.row],isXIB?@"->XIB":@""];
         cell.contentView.backgroundColor = [UIColor redColor];

    })
    .zfc_referenceSizeForHeaderInSection(^CGSize(UICollectionView *collectionView, NSInteger section) {

         return CGSizeMake(200, 40);
    })
    .zfc_collectionElementKindSectionHeader(^(UICollectionView *collectionView, __kindof ZFC_CollectionHeaderFooterView *sectionHeaderView, NSInteger section) {

          sectionHeaderView.myLabel.text = [NSString stringWithFormat:@"我是第-- %ld --段头%@",section,isXIB?@"->XIB":@""];
          sectionHeaderView.myView.backgroundColor = [UIColor greenColor];

    })
    .zfc_referenceSizeForFooterInSection(^CGSize(UICollectionView *collectionView, NSInteger section) {

          return CGSizeMake(200, 40);
    })
    .zfc_collectionElementKindSectionFooter(^(UICollectionView *collectionView, __kindof ZFC_CollectionHeaderFooterView *sectionFooterView, NSInteger section) {

          sectionFooterView.myLabel.text = [NSString stringWithFormat:@"我是第-- %ld --段尾%@",section,isXIB?@"->XIB":@""];
          sectionFooterView.myView.backgroundColor = [UIColor darkGrayColor];

    })
    .zfc_didSelectItemAtIndexPath(^(UICollectionView *collectionView, NSIndexPath *indexPath) {
          NSLog(@"我点击了%@",strongSelf.dataSource[indexPath.row]);
    });

    }];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          for(NSInteger i = 2; i < 5; i++) {
              [self.dataSource addObject:[NSString stringWithFormat:@"测试:%ld",i]];
          }
          [self.collectionView.creater zfc_reloadData];
    });
```

# 4.复杂tableView的抽离
```
    _isXIB = YES;
    TableViewCellConfigBlock cellConfigBlock = ^(NSIndexPath* indexPath,UITableViewCell* cell,id model){
         [cell config:cell cellModel:model indexPath:indexPath];
    };

    TableViewHeaderHeightBlock headerHeightConfigBlock = ^CGFloat(NSInteger section, id secModel) {
         return 45;
    };

    TableViewSectionHeaderViewConfigBlock sectionHeaderViewConfigBlock = ^(NSInteger section,ZFCTableViewHeaderFooterView *headerView,id model){
          headerView.myLabel.backgroundColor = [UIColor cyanColor];
          headerView.myLabel.text = @"我是段头"; 
    };


    TableViewFooterHeightBlock sectionFooterHeightConfigBlock = ^CGFloat(NSInteger section, id secModel){
          return 35;
    };

    TableViewSectionFooterViewConfigBlock sectionFooterViewConfigBlock = ^(NSInteger section,ZFCTableViewHeaderFooterView *footerView,id model) { 
          footerView.myLabel.backgroundColor = [UIColor blueColor];
          footerView.myLabel.text = @"我是段尾";
    };


    TableViewCellDidSelectBlock didSelectedBlock = ^(NSIndexPath* indexPath,id cell,ZFC_TableViewRowSuperComplexModel *model){
           NSLog(@"点击了");
    };

    TableViewCellDeleteBlock deleteBlock = ^BOOL(NSIndexPath* indexPath,ZFC_TableViewRowSuperComplexModel *model){
           return YES;
    };
    self.tableViewConfig=[[ZFC_TableViewComplexConfig alloc]initWithDataSource:self.dataSource
                                                                      sections:5
                                                              headerIdentifier:[NSString stringWithFormat:@"ZFCTableViewHeaderFooterView%@",_isXIB?@"_XIB":@""]
                                                              footerIdentifier:[NSString stringWithFormat:@"ZFCTableViewHeaderFooterView%@",_isXIB?@"_XIB":@""]
                                                              isCellNib:_isXIB
                                                              isSectionHeaderNib:_isXIB
                                                              isSectionFooterNib:_isXIB
                                                              isCanDelete:YES
                                                              configCellBlock:cellConfigBlock
                                                              configSectionHeaderViewBlock:sectionHeaderViewConfigBlock
                                                              configSectionFooterViewBlock:sectionFooterViewConfigBlock
                                                              headerHeightBlock:headerHeightConfigBlock
                                                              footerHeightBlock:sectionFooterHeightConfigBlock
                                                              didSelectBlock:didSelectedBlock
                                                              deleteBlock:deleteBlock];
    [self.tableViewConfig setTableViewDelegateAndDataSource:self.tableview];
    [self.view addSubview:self.tableview];
```

