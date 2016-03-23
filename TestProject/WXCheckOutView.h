//
//  WXCheckOutView.h
//  TestProject
//
//  Created by 舒永超 on 16/3/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CheckOutType) {
    CheckOutTypeWithNormal = 1,     //常规类型
    CheckOutTypeWithGetCoupon,      //获取优惠券
    CheckOutTypeWithUseCoupon       //使用优惠券
};

@interface WXCheckOutView : UIView

/**
 *  初始化结账信息界面
 *
 *  @param frame        界面view
 *  @param type         显示的类型
 *  @param checkOutInfo 结账信息
 *
 *  @return self
 */
-(instancetype)initWithFrame:(CGRect)frame withCheckOutType:(CheckOutType)type withBarCheckoutInfo:(id)checkOutInfo;

@end
