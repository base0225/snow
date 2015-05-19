//
//  ZJView.m
//  0923ZJ 定时器，雪花
//
//  Created by base on 15/09/19.
//  Copyright (c) 2015年 base. All rights reserved.
//

#import "ZJView.h"

@implementation ZJView

- (void)awakeFromNib
{
//    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(update) userInfo:nil repeats:YES];
    // 定时器
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
//    // 添加到主线程
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

}

- (void)update
{
    _snowY += 10;
    
    if (_snowY > [UIScreen mainScreen].bounds.size.height) {
        _snowY = 0;
    }
    
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
static int _snowY = 0;

- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"雪花"];
    
    //绘制雪花
    [image drawAtPoint:CGPointMake(0, _snowY)];
    
}


@end
