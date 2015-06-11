//
//  AudioPlayerViewController.m
//  AudioPlayer
//
//  Created by foreveross－bj on 15/1/23.
//  Copyright (c) 2015年 foreveross－bj. All rights reserved.
//

#import "AudioPlayerViewController.h"
#import "STKAudioPlayer.h"

@interface AudioPlayerViewController ()

@property (nonatomic, strong) STKAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UISlider *slider;

@end

@implementation AudioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.audioPlayer = [[STKAudioPlayer alloc] initWithOptions:(STKAudioPlayerOptions){ .flushQueueOnSeek = YES, .enableVolumeMixer = YES, .equalizerBandFrequencies = {50, 100, 200, 400, 800, 1600, 2600, 16000} }];
    self.audioPlayer.volume = 0.5;
    self.slider.value = 0.5;
    
}
- (IBAction)volume:(UISlider *)sender {
    NSLog(@"%f", sender.value);
    self.audioPlayer.volume = sender.value;
}

- (IBAction)player:(id)sender {
    NSString *string = @"http://1.happysay.sinaapp.com/该死的温柔.mp3";
    string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [_audioPlayer queueURL:[NSURL URLWithString:string]];
}
- (IBAction)stop:(id)sender {
    [_audioPlayer stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
