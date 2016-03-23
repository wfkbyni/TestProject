//
//  ViewController.m
//  TestProject
//
//  Created by 舒永超 on 16/3/18.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "ViewController.h"
#import "GTMBase64+Des.h"
#import "DeviceUtility.h"

#import "NSObject+Swizzling.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xxx;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view.layer removeFromSuperlayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnExecAction:(id)sender {
    NSInteger alpha = self.myTableView.alpha;
    
    CGRect tableViewFrame = self.myTableView.frame;
    float height = CGRectGetHeight(tableViewFrame);
    CGRect beginFrame = CGRectMake(CGRectGetMinX(tableViewFrame), CGRectGetMinY(tableViewFrame), CGRectGetWidth(tableViewFrame), 0);
    
    if (alpha == 0) {
        self.myTableView.frame = beginFrame;
        [UIView animateWithDuration:0.5 animations:^{
            self.myTableView.alpha = 1;
            self.myTableView.frame = tableViewFrame;
            self.xxx.constant = 5;
            [self.view layoutIfNeeded];
        }];
    }else{
        self.myTableView.frame = tableViewFrame;
        [UIView animateWithDuration:0.5 animations:^{
            self.myTableView.alpha = 0;
            
            self.myTableView.frame = beginFrame;
            
            self.xxx.constant = 200;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            
            self.myTableView.frame = CGRectMake(CGRectGetMinX(tableViewFrame), CGRectGetMinY(tableViewFrame), CGRectGetWidth(tableViewFrame), height);
        }];
    }
    
    NSString *string = @"JBNkl/Wyh02+rQW0HrEdC4GRx6n0mCgpv4XSmQfrgCFkfpKJLkDCD+Lv0KVt vCgxn84E2RLwasPf1RPFV8zyCE+GiuQ/zSTN0tTu1uUyvDcC7xIItYiRblEw 1vU0cGFmVZFx28DYzvOnB31AMp8oQfgaXQ3Ido92No0sKTD9pZxj3fb4otA5 RQU62+UlvFqVtvl88zZTIzjJch2IsstEerjEUF9U8PvsdTtOiT8cysyZbEFJ GWW/BUZXJouIbZyZYcrxYZEReoXiy1mK8rqWa3JGlYkNcKXFlfDLp7wPwSgm x+hmUZ+ReMjS8oQZn8NKV3i9h6TSwPEBSyXDTPlDtf74Ssvi5ixfJ3amqQUN qAos9LFK395k/won9voLDN4ud8+IXXBPgDSWb+PnuHyPWEN3rZNgypWfHtOr iaPjEqVweTmwMEf1Ep2ARemIQHQfW2cKewf/a4jPmontkekDbaA9CK9OCS/4 puAm223pqN/C9+0S2xVmMv3Jpuu3PGcavm+jKi/gMXZcKknpWQ8s1VvNBapB Ekvo0U+SVHYlZNII+lCRJclzGdLCcXJIDUBeHRyMLbsnqFULcdUs057niWjS BHdcbZEtPwXZyxHvNeKVfxZ4mZUnci2NV4OVKZLCJdknVjY5TeS3rwFSqce7 h8MAegRGQih166G8WKprgZaC9padAE+KXlClyTFhdn9LyPj59of4QINya+Qy 5sHdgBzgs5dlpMBx/t/zHNu2J1zYvW9SJbrqUyrWt75HyDDznp4WH9oCCc5l WBuL1dco+BjBTY7uhLQp3rwb3H89Fg1gpJR61hCYrWaFAG4a1vYy7Xvq51Kl cdo2FuiBmyXWco1jYvOIGr6/+xLP6BVkR/6Ab0rE0VfPOYtsTS8NChVGo91j kBzHU7eJrJ9EH57MXVIC5GZqHlQr5U47VrlMyOnW6/DspHBs+BR73zskpBzb qm0jdUuTiWxHAfq5K5mguS9xrt4FdNwHsdEgQfhpSyAjAf21M446Gm6n11bR sB1vTtLemCLyAT1FWZfETZmLhx+yuWvTK2oFURQ9dIsT4Qx2ABgDRyCQMjwD vfUsBBghtmS7+0JkWuU=";
    
    NSLog(@"解密后的：%@",[GTMBase64 desDecrypt:string]);

    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"账号：%ld",indexPath.row];
    
    return cell;
}
@end
