//
//  ViewController.m
//  MSTabbebView
//
//  Created by Midhun on 7/24/14.
//  Copyright (c) 2014 Midhun. All rights reserved.
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


#import "ViewController.h"
#import "MSTabbedView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *viewArray=[[NSMutableArray alloc]init];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 250, 350)];
   [view1 setBackgroundColor:[UIColor whiteColor]];
    [view1.layer setBorderWidth:5.0];
    [view1.layer setBorderColor:[UIColor colorWithRed:4.0/255.0 green:197.0/255.0 blue:197.0/255.0 alpha:1.0].CGColor];
    
    UIImageView *imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 200, 300)];
    [imageView1 setImage:[UIImage imageNamed:@"ad1.jpg"]];
    
    [view1 addSubview:imageView1];
    [viewArray addObject:view1];
    
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 250, 150)];
    [view2 setBackgroundColor:[UIColor whiteColor]];
    UIImageView *imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 200, 130)];
    [imageView2 setImage:[UIImage imageNamed:@"lamborghini.jpg"]];
     [view2 addSubview:imageView2];
     [viewArray addObject:view2];
    [view2.layer setBorderWidth:5.0];
    [view2.layer setBorderColor:[UIColor colorWithRed:4.0/255.0 green:197.0/255.0 blue:197.0/255.0 alpha:1.0].CGColor];
    
    UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 250, 350)];
    [view3 setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imageView3=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    [imageView3 setImage:[UIImage imageNamed:@"music.png"]];
    
    [view3 addSubview:imageView3];
    [view3.layer setBorderWidth:5.0];
    [view3.layer setBorderColor:[UIColor colorWithRed:4.0/255.0 green:197.0/255.0 blue:197.0/255.0 alpha:1.0].CGColor];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 150, 80, 40)];
    
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor=[UIColor grayColor];
    [view3 addSubview:btn];
    
     [viewArray addObject:view3];
   
    
    UIView *view4=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 250, 350)];
    [view4 setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imageView4=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 200, 300)];
    [imageView4 setImage:[UIImage imageNamed:@"wall3.jpg"]];
    
    [view4 addSubview:imageView4];
    [viewArray addObject:view4];
    [view4.layer setBorderWidth:5.0];
    [view4.layer setBorderColor:[UIColor colorWithRed:4.0/255.0 green:197.0/255.0 blue:197.0/255.0 alpha:1.0].CGColor];
    
    UIView *view5=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 250, 350)];
      [view4 setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imageView5=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 200, 300)];
    [imageView5 setImage:[UIImage imageNamed:@"wall1.jpg"]];
    
    [view5 addSubview:imageView5];
    [viewArray addObject:view5];
    [view5 setBackgroundColor:[UIColor whiteColor]];

    [view5.layer setBorderWidth:5.0];
    [view5.layer setBorderColor:[UIColor colorWithRed:4.0/255.0 green:197.0/255.0 blue:197.0/255.0 alpha:1.0].CGColor];
    
    
    MSTabbedView *testView=[[MSTabbedView alloc]initWithFrame:CGRectMake(10, 20, 290, 400) withDataSource:viewArray];
    
    
   [testView setSizeOfTab:CGSizeMake(40, 40)];
    
    NSMutableArray *unselectedIconsArray=[[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"icon1u.png"],[UIImage imageNamed:@"icon2u.png"],[UIImage imageNamed:@"icon3u.png"],[UIImage imageNamed:@"icon4u.png"],[UIImage imageNamed:@"icon5u.png"], nil];
    
     NSMutableArray *selectedIconsArray=[[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"icon1.png"],[UIImage imageNamed:@"icon2.png"],[UIImage imageNamed:@"icon3.png"],[UIImage imageNamed:@"icon4.png"],[UIImage imageNamed:@"icon5.png"], nil];
    
    
    [testView setTabIconsForUnselected:unselectedIconsArray andSelected:selectedIconsArray];
    
    testView.center=self.view.center;
    
    [testView setSizeOfTable:CGSizeMake(290, 360)];
    
 //   [testView setBackgroundColor:[UIColor purpleColor]];
    
    [testView setTableBackgroundColor:[UIColor clearColor]];
   // [testView setBorderWithBorderColour:[UIColor blackColor] andBorderWidth:2.0];
  [testView setBorderForTableWithBorderColour:[UIColor colorWithRed:4.0/255.0 green:197.0/255.0 blue:197.0/255.0 alpha:1.0] andBorderWidth:2.0];
    [self.view addSubview:testView];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)buttonClicked
{
     NSLog(@"button clicked");
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:[NSString stringWithFormat:@"Button  Clicked"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
