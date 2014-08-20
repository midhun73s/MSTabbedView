//
//  MSTabbedView.m
//  MSTabbebView
//
//  Created by Midhun on 7/24/14.
//  Copyright (c) 2014 InApp. All rights reserved.
//

#import "MSTabbedView.h"

@implementation MSTabbedView{
   
    UITableView *table;
    
    NSMutableArray *tableDataSource;
    NSMutableArray *tabArray;
    CGPoint lastContentOffset;
    
    NSInteger previousDisplayedCell;
    
    BOOL isDownward;
    BOOL relativeTabWidth;
    
    BOOL customTabIcons;    //is set to yes if custom icons for selection tabs are provided by user
    
    NSInteger selectedTab;
    
    CGFloat tabWidth;
    
    NSMutableArray*unSelectedArray;
    NSMutableArray*selectedArray;
    
    
    
}

#pragma mark Initialization methods

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
       // [self initializeTable];
        
        
        
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame withDataSource:(NSMutableArray *)dataSource{
     self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        
        
        [self initializeTableWithDataSorce:dataSource];
        
        [self createTabs];
        
    }
    return self;
    
}
-(void)initializeTableWithDataSorce:(NSMutableArray*)dataSource{
    tableDataSource=[[NSMutableArray alloc]init];
    tableDataSource=dataSource;
    // UIView *view=[tableDataSource objectAtIndex:0];
    
    table=[[UITableView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.bounds)+10, CGRectGetMinY(self.bounds)+60, CGRectGetWidth(self.bounds)-20, CGRectGetHeight(self.bounds)-70)];
    table.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [table setBounces:NO];
 //   table=[[UITableView alloc ]initWithFrame:CGRectMake(CGRectGetMinX(self.bounds)+10, CGRectGetMinY(self.bounds)+50, CGRectGetWidth(self.bounds)-20, CGRectGetHeight(self.bounds)-70) style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    [self addSubview:table];
    tabWidth=table.frame.size.width/tableDataSource.count-2;
    
    lastContentOffset=table.contentOffset;
    relativeTabWidth=YES;
    
}

#pragma mark setter methods

-(void)setBorderWithBorderColour:(UIColor *)color andBorderWidth:(CGFloat)width{
    self.layer.borderColor=color.CGColor;
    self.layer.borderWidth=width;
    
    
}
-(void)setBorderForTableWithBorderColour:(UIColor *)color andBorderWidth:(CGFloat)width{
    table.layer.borderColor=color.CGColor;
    table.layer.borderWidth=width;
    
}

-(void)setSizeOfTab:(CGSize)sizeOfTab{
    _sizeOfTab=sizeOfTab;
    
    relativeTabWidth=NO;
    
    for (UIView * view in self.subviews) {
        
        for (UIView * view1 in tabArray) {
            if (view.tag==view1.tag) {
                [view1 removeFromSuperview];
                
            }
        }
        
    }
    [tabArray removeAllObjects];
    [self createTabs];
    CGRect tableFrame=table.frame;
    tableFrame.origin.y=_sizeOfTab.height;
    [table setFrame:tableFrame];
    
    
}

-(void)setSizeOfTable:(CGSize)sizeOfTable{
    
    _sizeOfTable=sizeOfTable;
    
    CGRect tableFrame=table.frame;
    tableFrame.size.width=_sizeOfTable.width;
    tableFrame.size.height=_sizeOfTable.height;
    
    [table setFrame:tableFrame];
    tabWidth=table.frame.size.width/tableDataSource.count-2;
    
    for (UIView * view in self.subviews) {
        
        for (UIView * view1 in tabArray) {
            if (view.tag==view1.tag) {
                [view1 removeFromSuperview];
                
            }
        }
        
    }
    [tabArray removeAllObjects];
    [self createTabs];
    
    
}

-(void)setTabIconsForUnselected:(NSMutableArray *)unslectedIcons andSelected:(NSMutableArray *)selectedIcons
{
    
    unSelectedArray=unslectedIcons;
    selectedArray=selectedIcons;
    customTabIcons=YES;
    
    for (UIView * view in self.subviews) {
        
        for (UIView * view1 in tabArray) {
            if (view.tag==view1.tag) {
                [view1 removeFromSuperview];
                
            }
        }
        
    }
    
    
    [tabArray removeAllObjects];
    [self createTabs];
    
    
    
}

-(void)setTableBackgroundColor:(UIColor *)tableBackgroundColor
{
    
    _tableBackgroundColor=tableBackgroundColor;
    
    [table setBackgroundColor:_tableBackgroundColor];
    
    
    
}


#pragma mark View setup methods


-(void)createTabs{
    tabArray=[[NSMutableArray alloc]init];
    NSLog(@"table  frame:%@",NSStringFromCGRect(table.frame));
    selectedTab=0;
    
    for (int i=0; i<tableDataSource.count; i++) {
        
        UIView *tabView=[[UIView alloc]init];
        if (relativeTabWidth) {
            
        
       [tabView setFrame:CGRectMake(CGRectGetMinX(table.frame)+i*tabWidth+i*2, CGRectGetMinY(table.frame)-50-2, tabWidth, 50)];
        }
        else       {
            
           [tabView setFrame:CGRectMake(CGRectGetMinX(table.frame)+i*self.sizeOfTab.width+i*2, CGRectGetMinY(table.frame)-self.sizeOfTab.height-2, self.sizeOfTab.width, self.sizeOfTab.height)];
            
        }
     //   tabView.backgroundColor=[UIColor magentaColor];
        tabView.tag=i;
       
        
        
        
        if (unSelectedArray.count) {
            
            if (selectedArray.count==unSelectedArray.count&& unSelectedArray.count==tableDataSource.count) {
                
                UIImageView *img=[[UIImageView alloc]initWithFrame:tabView.bounds];
                [img setContentMode:UIViewContentModeScaleToFill];
                
                [img setImage:[unSelectedArray objectAtIndex:i]];
                
                [img setTag:10];
                [tabView addSubview:img];
                
                UIImageView *img1=[[UIImageView alloc]initWithFrame:tabView.bounds];
                
                
                
                
                [img setContentMode:UIViewContentModeScaleToFill];
                
                [img1 setImage:[selectedArray objectAtIndex:i]];
                 [img1 setTag:11];
                [img1 setHidden:YES];
                
                [tabView addSubview:img1];
            }
            else{
                
                 NSLog(@"ERROR: both icons array and datasource array should be of same count!!");
            }
            
            
            
        }else{
            UIImageView *img=[[UIImageView alloc]initWithFrame:tabView.bounds];
            [img setContentMode:UIViewContentModeScaleToFill];
            
            [img setImage:[UIImage imageNamed:@"Right-Arrow-icon.png"]];
            [tabView addSubview:img];
        }
        
        
        
        
        
        
      //  [tabView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Right-Arrow-icon.png"]]];

     /*   if (tabView.tag==selectedTab) {
            [tabView setBackgroundColor:[UIColor purpleColor]];
                    }
        else
        {
            [tabView setBackgroundColor:[UIColor blackColor]];
            
        }
        */
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tabTapped:)];
        [tabView addGestureRecognizer:tap];
        
        [tabArray addObject:tabView];
        [self addSubview:tabView];
        [ self insertSubview:tabView belowSubview:table];
        
        
        NSLog(@"tab frame:%@",NSStringFromCGRect(tabView.frame));

    }
    
}




-(void)showImageView:(UIImageView*)imgVw{
    CGRect frame=imgVw.frame;
    
    frame.origin.y=0;
    if (relativeTabWidth) {
        frame.size.height=50;
  
    }
    else{
    frame.size.height=self.sizeOfTab.height;
    }
    [imgVw setHidden:NO];
    
    [ UIView animateWithDuration:0.3 animations:^{
        
        
        [imgVw setFrame:frame];
        
    } completion:^(BOOL finished){
        
        
    }];
    
    
}

-(void)hideImageView:(UIImageView*)imgVw{
    CGRect frame=imgVw.frame;
    
    if (relativeTabWidth) {
        frame.origin.y=50;
        
    }
    else{
    frame.origin.y=self.sizeOfTab.height;
    }
    frame.size.height=0;
    
    [ UIView animateWithDuration:0.3 animations:^{
        
        
        [imgVw setFrame:frame];

    } completion:^(BOOL finished){
        
        [imgVw setHidden:YES];
    }];
    
    
    
}




#pragma mark Table View delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return tableDataSource.count;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view=[tableDataSource objectAtIndex:indexPath.row];
     NSLog(@"height %f",CGRectGetHeight(view.frame));
    
    return( CGRectGetHeight(view.frame)+20);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"TableViewCell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
  
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:[tableDataSource objectAtIndex:indexPath.row]];
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (!isDownward) {
        
    
    
for (UIView * view in tabArray) {

        if (view.tag==indexPath.row) {
       //     [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"arroworange.png"]]];
            self.currentDisplayingView=view.tag;
            if (customTabIcons) {
                
                
                for (UIImageView *v in view.subviews) {
                    if (v.tag==11) {
                        //[v setHidden:NO];
                        
                        [self showImageView:v];
                    }
                }
            }
            else{
                
                view.layer.borderColor=[UIColor blackColor].CGColor;
                view.layer.borderWidth=4.0;
            }
            
        }
        else{
         //  [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"arrowblack.png"]]];
            if (customTabIcons) {
                
                
                for (UIView *v in view.subviews) {
                    if (v.tag==11) {
                       // [v setHidden:YES];
                        [self hideImageView:(UIImageView*)v];
                    }
                }
            }
            else{
                
                view.layer.borderColor=[UIColor clearColor].CGColor;
                view.layer.borderWidth=0.0;
            }

            
        }
        
        
    }
    
    }
     
     
}


-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
        
        
        for (UIView * view in tabArray){
            
            
          if (isDownward) {
            
              if (view.tag==indexPath.row+1) {
            //      [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"arroworange.png"]]];
                  self.currentDisplayingView=view.tag;
                  if (customTabIcons) {
                      
                  
                  for (UIView *v in view.subviews) {
                      if (v.tag==11) {
                      //    [v setHidden:NO];
                          
                          [self showImageView:(UIImageView*)v];
                      }
                  }
                  }
                  else{

                 view.layer.borderColor=[UIColor blackColor].CGColor;
                view.layer.borderWidth=4.0;
                  }
                
              }
              else{
                 // [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"arrowblack.png"]]];
                  
                  if (customTabIcons) {
                      
                      
                      for (UIView *v in view.subviews) {
                          if (v.tag==11) {
                             // [v setHidden:YES];
                              [self hideImageView:(UIImageView*)v];
                          }
                      }
                  }
                  else{
                      
                      view.layer.borderColor=[UIColor clearColor].CGColor;
                      view.layer.borderWidth=0.0;
                  }

                
              }
          }
            
        }
    
 
    
    
    
    
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint currentOffset = scrollView.contentOffset;
    if (currentOffset.y > lastContentOffset.y){
        // Downward
     //   NSLog(@"downward");
        isDownward=YES;
        
        
    }
    else{
        // Upward
        
   //     NSLog(@"upward");
        isDownward=NO;
        
    }
    lastContentOffset = currentOffset;
}


#pragma  mark Tab action

-(void)tabTapped:(UITapGestureRecognizer*)gesture{
    
     NSLog(@"tapped on view %ld",(long)gesture.view.tag);
    
   
    
    [table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:gesture.view.tag inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
