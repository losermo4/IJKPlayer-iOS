//
//  MPlayerViewController.m
//  IJKPlayer-iOS_Example
//
//  Created by gaomin on 2019/12/20.
//  Copyright © 2019 losermo4@gmail.com. All rights reserved.
//

#import "MPlayerViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>


static NSString *url = @"https://xy2.v.netease.com/r/video/20190814/7db8102c-1b18-4a59-ac70-ec03137f1c2e.mp4";


@interface MPlayerViewController ()

@property (nonatomic, strong) id<IJKMediaPlayback> player;;
@property (nonatomic, strong) UIView *container;

@end

@implementation MPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(40, 44, 40, 40)];
    back.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:back];
    [back addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    _container = [UIView new];
    [self.view addSubview:_container];
    self.container.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200);
    
    
    [IJKFFMoviePlayerController setLogReport:YES];
       [IJKFFMoviePlayerController setLogLevel:k_IJK_LOG_DEBUG];
       [IJKFFMoviePlayerController checkIfFFmpegVersionMatch:YES];
       IJKFFOptions *options = [IJKFFOptions optionsByDefault];
       self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:url] withOptions:options];
       self.player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
       self.player.view.frame = self.container.bounds;
       self.player.scalingMode = IJKMPMovieScalingModeAspectFit;
       self.player.shouldAutoplay = YES;
       self.view.autoresizesSubviews = YES;
       [self.container addSubview:self.player.view];
       
        [self.player prepareToPlay];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player shutdown];
}


- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
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
