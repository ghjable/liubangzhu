//
//  XuanshangViewController.m
//  liubangzhu
//
//  Created by able on 15/12/21.
//  Copyright © 2015年 able. All rights reserved.
//

#import "XuanshangViewController.h"

@interface XuanshangViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView1;

}
@property(nonatomic,copy) NSString *Str1;
@property(nonatomic,copy) NSString *Str2;
@property(nonatomic,copy) NSString *Str3;


@end

@implementation XuanshangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=maincolor;
    [self setScrollView];
}
-(void)setScrollView
{
    scrollView1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 164)];
    scrollView1.showsHorizontalScrollIndicator=NO;
    scrollView1.showsVerticalScrollIndicator=NO;
    scrollView1.bounces=NO;
    [self.view addSubview:scrollView1];
    _Str1=@"img355-160";
    _Str2=@"img355-210";
    _Str3=@"img375-120";
    NSArray *array=[NSArray arrayWithObjects:_Str3,_Str1,_Str2,_Str3,_Str1, nil];
    
    // 添加图片
    for (int i=0; i<array.count; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, 164)];
//        [imageView sd_setImageWithURL:[NSURL URLWithString:array[i]]];
        imageView.image=[UIImage imageNamed:array[i]];
        [scrollView1 addSubview:imageView];
//        imageView.tag=i+10;
//        imageView.userInteractionEnabled=YES;
//        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
//        tap.numberOfTapsRequired=1;
//        tap.numberOfTouchesRequired=1;
//        [imageView addGestureRecognizer:tap];
        
        
    }
    scrollView1.contentOffset = CGPointMake( [UIScreen mainScreen].bounds.size.width, 0);
    //tag
    scrollView1.tag = 2000;
    scrollView1.contentSize = CGSizeMake( [UIScreen mainScreen].bounds.size.width * array.count, 164);
    scrollView1.pagingEnabled = YES;
    scrollView1.delegate = self;
    [self.view addSubview:scrollView1];
    //UIPageControl
    //实例化
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-300)/2, 120, 300, 30)];
    
    //    pageControl.backgroundColor = [UIColor purpleColor];
    //设置点点的个数
    pageControl.numberOfPages = array.count-2;
    //设置默认第几个点
    pageControl.currentPage = 0;
    //设置选中前点点的颜色
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //设置选中后点点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    //事件
    [pageControl addTarget:self action:@selector(pageControl:) forControlEvents:UIControlEventValueChanged];
    
    //tag
    pageControl.tag = 1000;
    scrollView1.pagingEnabled=YES;
    [self.view addSubview:pageControl];
    //定时器
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    

}
#pragma mark - pageControl的方法
- (void)pageControl:(UIPageControl *)pageControl{
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:2000];
    NSInteger i = pageControl.currentPage;
    [UIView animateWithDuration:0.5 animations:^{
        scrollView.contentOffset = CGPointMake((i+1) *  [UIScreen mainScreen].bounds.size.width, 0);
    }];
}
//定时器触发
-(void)timerFired{
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:1000];
    static int i=0;
    i++;
    scrollView1.contentOffset=CGPointMake([UIScreen mainScreen].bounds.size.width*(i%3), 0);
    
    if (i==4||i==0) {
        
        if (i==0) {
            i=3;
        }else{
            i=1;
        }
        
    }
    pageControl.currentPage = i - 1;
}


@end
