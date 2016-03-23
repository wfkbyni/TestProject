//
//  WXCheckOutView.m
//  TestProject
//
//  Created by 舒永超 on 16/3/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "WXCheckOutView.h"

@interface WXCheckOutView()

@property (nonatomic, strong) UILabel *userMoneyLab;           //使用金额lab
@property (nonatomic, strong) UIButton *refershUserMoneyBtn;   //刷新使用金额btn
@property (nonatomic, strong) UIButton *getCouponBtn;          //获取优惠券btn
@property (nonatomic, strong) UIButton *checkOutBtn;           //结账下机btn
@property (nonatomic, strong) UIButton *couponSaleBtn;         //优惠券抵用按钮
@end

#define offset 30
#define btnWithWidth 120
#define btnWithHeight 50

@implementation WXCheckOutView

-(instancetype)initWithFrame:(CGRect)frame withCheckOutType:(CheckOutType)type withBarCheckoutInfo:(id)checkOutInfo{
    
    if (self = [super initWithFrame:frame]) {
    
        [self setBackgroundColor:[UIColor orangeColor]];
        
        [self addSubview:self.userMoneyLab];
        [self addSubview:self.refershUserMoneyBtn];
        [self addSubview: self.checkOutBtn];
        
        switch (type) {
            case CheckOutTypeWithNormal:
            {
                
            }
                break;
            case CheckOutTypeWithGetCoupon:
            {
                [self addSubview:[self getCouponBtn]];
                
                [self resetGetCouponSize];
            }
                break;
            case CheckOutTypeWithUseCoupon:
            {
                [self addSubview:[self couponSaleBtn]];
                
                [self resetUseCouponSize];
            }
                break;
            default:
                break;
        }
    }
    
    return self;
}

/**
 *  重置获取优惠券frame
 */
- (void)resetGetCouponSize{
 
    float width = CGRectGetWidth(self.frame) / 2;
    
    float offsetY = CGRectGetMaxY(self.refershUserMoneyBtn.frame) + offset / 2;
    
    self.getCouponBtn.frame = CGRectMake(width - btnWithWidth - 5, offsetY, btnWithWidth, btnWithHeight);
    
    self.checkOutBtn.frame = CGRectMake(width + 5, offsetY, btnWithWidth, btnWithHeight);
    
}

/**
 *  重置使用优惠券frame
 */
- (void)resetUseCouponSize{
    
    self.couponSaleBtn.frame = CGRectMake(0,
                                          CGRectGetMaxY(self.refershUserMoneyBtn.frame) + offset / 2,
                                          CGRectGetWidth(self.frame),
                                          btnWithHeight / 2);
    
    self.checkOutBtn.frame = CGRectMake((CGRectGetWidth(self.frame) - btnWithWidth) / 2,
                                        CGRectGetMaxY(self.couponSaleBtn.frame) + offset / 2,
                                        btnWithWidth,
                                        btnWithHeight);
    
}


-(UILabel *)userMoneyLab{
    if (!_userMoneyLab) {
        _userMoneyLab = [[UILabel alloc] initWithFrame:CGRectMake(0, offset, CGRectGetWidth(self.frame), 21)];
        _userMoneyLab.font = [UIFont systemFontOfSize:15.0f];
        _userMoneyLab.textAlignment = NSTextAlignmentCenter;
        _userMoneyLab.text = @"本次上机使用3.00元";
    }
    
    return _userMoneyLab;
}

-(UIButton *)refershUserMoneyBtn{
    if (!_refershUserMoneyBtn) {
        _refershUserMoneyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _refershUserMoneyBtn.frame = CGRectMake(0, CGRectGetMaxY(self.userMoneyLab.frame) + offset / 2, CGRectGetWidth(self.frame), 30);
        _refershUserMoneyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_refershUserMoneyBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_refershUserMoneyBtn setTitle:@"刷新上机消费金额" forState:UIControlStateNormal];
        [_refershUserMoneyBtn setImage:[UIImage imageNamed:@"online_refresh"] forState:UIControlStateNormal];
        
    }
    return _refershUserMoneyBtn;
}

-(UIButton *)getCouponBtn{
    if (!_getCouponBtn) {
        _getCouponBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getCouponBtn setTitle:@"获取优惠券" forState:UIControlStateNormal];
        [_getCouponBtn setBackgroundColor:[UIColor greenColor]];
    }
    return _getCouponBtn;
}

-(UIButton *)couponSaleBtn{
    if (!_couponSaleBtn) {
        _couponSaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _couponSaleBtn.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 30);
        _couponSaleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_couponSaleBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_couponSaleBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_couponSaleBtn setTitle:@"您可以使用优惠券抵扣3.00元" forState:UIControlStateNormal];
        [_couponSaleBtn setImage:[UIImage imageNamed:@"online_refresh"] forState:UIControlStateNormal];
    }
    return _couponSaleBtn;
}

-(UIButton *)checkOutBtn{
    if (!_checkOutBtn) {
        _checkOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _checkOutBtn.frame = CGRectMake((CGRectGetWidth(self.frame) - btnWithWidth) / 2, CGRectGetMaxY(self.refershUserMoneyBtn.frame) + offset / 2, btnWithWidth, btnWithHeight);
        [_checkOutBtn setBackgroundColor:[UIColor redColor]];
        [_checkOutBtn setTitle:@"结账下机" forState:UIControlStateNormal];
    }
    return _checkOutBtn;
}

@end
