//
//  ViewController.m
//  SendMsg
//
//  Created by 魏旺 on 16/3/9.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (nonatomic, strong) NSTimer *currentTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendClick {
    [_sendButton setImage:[UIImage imageNamed:@"timerBtn_imageView_selected"] forState:UIControlStateNormal];
    _currentTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeShow) userInfo:nil repeats:YES];
    [_currentTimer fire];
}

- (void)timeShow {
    static int index = 10;
    index--;
    if (index==0) {
        NSLog(@"结束了。");
        [_sendButton setTitle:@"重新发送" forState:UIControlStateNormal];
        [_sendButton setImage:[UIImage imageNamed:@"timerBtn_imageView_normal"] forState:UIControlStateNormal];
        [_currentTimer invalidate];
        index = 10;
        self.view.userInteractionEnabled = YES;
        return;
    }
    self.view.userInteractionEnabled = NO;
    [self.sendButton setTitle:[NSString stringWithFormat:@"还剩%d秒", index] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
