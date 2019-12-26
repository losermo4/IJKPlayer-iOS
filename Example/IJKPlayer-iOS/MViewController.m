//
//  MViewController.m
//  IJKPlayer-iOS
//
//  Created by losermo4@gmail.com on 12/20/2019.
//  Copyright (c) 2019 losermo4@gmail.com. All rights reserved.
//

#import "MViewController.h"
#import "MPlayerViewController.h"

@interface MViewController ()

@end

@implementation MViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 88)];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonAction {
    MPlayerViewController *player = [MPlayerViewController new];
    [self presentViewController:player animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
