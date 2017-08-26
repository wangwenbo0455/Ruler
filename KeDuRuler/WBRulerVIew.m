//
//  WBRulerVIew.m
//  KeDuRuler
//
//  Created by 王文博 on 2017/8/26.
//  Copyright © 2017年 王文博. All rights reserved.
//

#import "WBRulerVIew.h"
#define DISTANCEVALUE 8.f // 每隔刻度实际长度8个点(间距)
@implementation WBRulerVIew
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
       
        self.frame =frame;
        self.rulerWidth = frame.size.width;
        self.rulerHeight  = frame.size.height;
        [self drawRuler];
    }
    return self;
}

- (void)drawRuler{
    
    CGMutablePathRef pathRef1 = CGPathCreateMutable();
    CGMutablePathRef pathRef2 = CGPathCreateMutable();
    
    shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.strokeColor = [UIColor lightGrayColor].CGColor;
    shapeLayer1.fillColor = [UIColor clearColor].CGColor;
    shapeLayer1.lineWidth = 1.f;
    shapeLayer1.lineCap = kCALineCapButt;
    
    shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer2.fillColor = [UIColor clearColor].CGColor;
    shapeLayer2.lineWidth = 1.f;
    shapeLayer2.lineCap = kCALineCapButt;
    
    //最长线和最短线间隔
    int logestLineAndShorestLineInternal = 15;
    //最长线和中间线间隔
    int logestLineAndMidLineInternal = 10;
    
    CGSize textSize;
    for (int i = 0; i <= 50; i++) {
        UILabel *rule = [[UILabel alloc] init];
        rule.textColor = [UIColor greenColor];
        rule.text = [NSString stringWithFormat:@"0"];// 刻度值
        rule.font = [UIFont systemFontOfSize:11.0];
        textSize = [rule.text sizeWithAttributes:@{ NSFontAttributeName : rule.font }];
        if (i % 10 == 0) {
            CGPathMoveToPoint(pathRef2, NULL, 0 + DISTANCEVALUE * i , 2);
            CGPathAddLineToPoint(pathRef2, NULL, 0 + DISTANCEVALUE * i, self.rulerHeight/2.0 - textSize.height);
            
            rule.frame = CGRectMake(DISTANCEVALUE*4.5+DISTANCEVALUE * i , self.rulerHeight/2.0  - textSize.height, 0, 0);
            [rule sizeToFit];
            [self addSubview:rule];
            
            
            
        }
        else if (i % 5 == 0) {
            CGPathMoveToPoint(pathRef1, NULL, 0 + DISTANCEVALUE * i , 2);
            CGPathAddLineToPoint(pathRef1, NULL, 0 + DISTANCEVALUE * i, self.rulerHeight/2.0 - textSize.height - logestLineAndMidLineInternal);
        }
        else
        {
            CGPathMoveToPoint(pathRef1, NULL, 0 + DISTANCEVALUE * i , 2);
            CGPathAddLineToPoint(pathRef1, NULL, 0 + DISTANCEVALUE * i, self.rulerHeight/2.0 - textSize.height - logestLineAndShorestLineInternal);
        }
    }
    shapeLayer1.path = pathRef1;
    shapeLayer2.path = pathRef2;
    
    [self.layer addSublayer:shapeLayer1];
    [self.layer addSublayer:shapeLayer2];
}

@end
