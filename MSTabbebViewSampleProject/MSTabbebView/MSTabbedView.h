//
//  MSTabbedView.h
//  MSTabbebView
//
//  Created by Midhun on 7/24/14.
//  Copyright (c) 2014 InApp. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MSTabbedView : UIView<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)UIColor* tableBackgroundColor;

@property(nonatomic)NSInteger currentDisplayingView;// gives the current displaying view's tag starting from 0.

@property(nonatomic)CGSize sizeOfTab; //size of the tabs. If not provided,default value will be set.height should be less than the MSTabbedViews's height minimum by  the height of tab.
@property(nonatomic)CGSize sizeOfTable;  //size of the table. If not provided,default value will be set



- (id)initWithFrame:(CGRect)frame withDataSource:(NSMutableArray*)dataSource; // datasource should be an array of Views.

-(void)setBorderWithBorderColour:(UIColor*)color andBorderWidth:(CGFloat)width;

-(void)setBorderForTableWithBorderColour:(UIColor*)color andBorderWidth:(CGFloat)width;

-(void)setTabIconsForUnselected:(NSMutableArray*)unslectedIcons andSelected:(NSMutableArray*)selectedIcons;//provide custom tab icons as UIImage . unselected and selected array should be of same count



@end
