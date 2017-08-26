//
//  WBRulerVIew.h
//  KeDuRuler
//
//  Created by 王文博 on 2017/8/26.
//  Copyright © 2017年 王文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBRulerVIew : UIView
{
    CAShapeLayer *shapeLayer1;
    CAShapeLayer *shapeLayer2;
}
@property (nonatomic) NSUInteger rulerHeight;
@property (nonatomic) NSUInteger rulerWidth;

@end
