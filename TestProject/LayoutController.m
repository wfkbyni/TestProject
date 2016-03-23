//
//  LayoutController.m
//  TestProject
//
//  Created by 舒永超 on 16/3/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "LayoutController.h"

#import "WXCheckOutView.h"

@interface LayoutController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginx;
@property (nonatomic, assign) int index;

@property (nonatomic, strong) WXCheckOutView *checkOutView;
@end

@implementation LayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addRandomView];
}

- (void)addRandomView{
   
    if (_checkOutView) {
        [_checkOutView removeFromSuperview];
    }
    
    CGRect frame = self.view.bounds;
    frame.origin.y = 320;
    frame.size.height = CGRectGetHeight(frame) - 400;
    _checkOutView = [[WXCheckOutView alloc] initWithFrame:frame withCheckOutType:arc4random_uniform(3) + 1 withBarCheckoutInfo:nil];
    [self.view addSubview:_checkOutView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)marginXAction:(id)sender {
    [self addRandomView];
    [UIView animateWithDuration:.25f animations:^{
        float x = arc4random_uniform(self.view.frame.size.width - 100);
        if (_index % 5 == 0) {
            x = 0;
            [[self.view viewWithTag:1001] setAlpha:0];
        }else{
            [[self.view viewWithTag:1001] setAlpha:1];
        }
        self.marginx.constant = x;
        _index ++;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
