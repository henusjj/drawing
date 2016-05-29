//
//  syjView.m
//  08-绘图联系
//
//  Created by 史玉金 on 16/5/5.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "syjView.h"

@implementation syjView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/



 - (void)drawRect:(CGRect)rect {
//     Drawing code
//     [self test];
     
 
//     [self text5];
  
     [self test3];
     
}

-(void)test{
    //1.c
    //获取当前绘图上下文....typedef struct CGContext *CGContextRef;

    CGContextRef  ref=UIGraphicsGetCurrentContext();
    //拼接路径，同时把路径添加到上下文当中
    CGContextMoveToPoint(ref, 50, 50);//获取的是x,y，起点
    CGContextAddLineToPoint(ref, 100, 100);//终点也是下一条线的起点
    //e.g
    CGContextAddLineToPoint(ref, 100, 50);//最终的终点
    CGContextAddLineToPoint(ref,50 ,50);
    //关闭路径
    CGContextClosePath(ref);
    
    
    //线宽
    CGContextSetLineWidth(ref, 1);//向内向外各一半
    
    //连接处的样式
    /**
     kCGLineJoinMiter,//默认
     kCGLineJoinRound,//圆角
     kCGLineJoinBevel//切角
     */
    CGContextSetLineJoin(ref, kCGLineJoinBevel);

    //头尾的样式
    /**
     kCGLineCapButt,默认
     kCGLineCapRound,圆角
     kCGLineCapSquare会比默认样式两边各多一哥线宽/2距离

     */
    CGContextSetLineCap(ref, kCGLineCapSquare);
    
    //渲染

    // 设置描边和填充(2者选其一)
    //设置颜色
//    CGContextSetRGBStrokeColor(ref, 1, 0, 0, 1);//描边颜色
//CGContextStrokePath(ref);//描边
//    CGContextSetRGBFillColor(ref,0, 1, 0, 1);//填充的颜色
    //    CGContextFillPath(ref);//填充===><CGContextDrawPath(ref, kCGPathFill);

//**************************************************************
    //描边且填充（2者都选）
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    CGContextDrawPath(ref, kCGPathFillStroke);

    
}

-(void)text5{
    //5.oc
    //创建路径对象
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    //通过路径对象 ，拼接路径
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(50, 100)];
    //关闭路径
    [path closePath];
    
    //设置线宽
    [path setLineWidth:10];//向外扩张
    
    //连接处样式
    [path setLineJoinStyle:kCGLineJoinBevel];
    
    //设置头尾的样式
    [path setLineCapStyle:kCGLineCapSquare];
   //同时设置描边和填充颜色
//    [[UIColor greenColor] set];
    
    //设置描边颜色
    [[UIColor redColor] setStroke];
    
    //设置填充颜色
    [[UIColor blueColor] setFill];
    
    //渲染
    [path stroke];
    [path fill];

}



-(void)test3{
    //wifi
    //oc
    
    CGFloat s=0;
    UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:3 startAngle:M_PI+M_PI_2+M_PI_4 endAngle:M_PI+M_PI_4 clockwise:0];
                         [path setLineWidth:5];
    [path stroke];


    for (int i=1; i<5; i++) {
 UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:s+i*10 startAngle:M_PI+M_PI_2+M_PI_4 endAngle:M_PI+M_PI_4 clockwise:0];
    
                      [path setLineWidth:5];
                      [path stroke];
    
    
    }
    
}
@end

