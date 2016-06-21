//
//  PlayerView.m
//  MediaProject
//
//  Created by CLT on 16/6/6.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "PlayerView.h"
#import <AVFoundation/AVFoundation.h>


@interface PlayerView ()

@property (nonatomic, assign) BOOL isShowInterview;

@end


@implementation PlayerView

- (id)initWithFrame:(CGRect)frame vedioUrl:(NSString *)vedioUrl
{
    self = [super init];
    self.frame = frame;

    _currentItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:vedioUrl]];
    _player = [AVPlayer playerWithPlayerItem:_currentItem];
    //每个layer都有个player，真正播放视频的是这个layer的player
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.frame = self.layer.bounds;
    
    [_currentItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [_currentItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [self.layer addSublayer:_playerLayer];
//    _isShowInterview = NO;
//    [self addMyInteractionView];
    return self;
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"itemPlayer = %@", object);
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    NSLog(@"keyPath = %@", keyPath);
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            NSLog(@"aaaaaaAVPlayerStatusReadyToPlay");
            [self.player play];
            self.progressSlider.maximumValue = CMTimeGetSeconds(self.player.currentItem.duration);
        }
        else if ([playerItem status] == AVPlayerStatusFailed) {
            NSLog(@"AVPlayerStatusFailed");
        }
        else {
            NSLog(@"other");
        }
    }
    else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        //        NSTimeInterval timeInterval = [self availableDuration];// 计算缓冲进度
        //        NSLog(@"Time Interval:%f",timeInterval);
        //        CMTime duration = self.playerItem.duration;
        //        CGFloat totalDuration = CMTimeGetSeconds(duration);
        //        [self.videoProgress setProgress:timeInterval / totalDuration animated:YES];
    }
}

- (void)addSlider
{
    self.progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, self.bounds.size.height - 20, self.bounds.size.width - 40, 20)];
    self.progressSlider.maximumTrackTintColor = [UIColor grayColor];
    self.progressSlider.thumbTintColor = [UIColor greenColor];
    self.progressSlider.minimumTrackTintColor = [UIColor whiteColor];
    [self.progressSlider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    [self.interactionView addSubview:self.progressSlider];
    
}

- (void)changeProgress:(UISlider *)slider
{
    //改变播放的进度
    CMTime current = self.player.currentTime;
    current.value = slider.value;
}

- (void)addMyInteractionView
{
    self.interactionView = [[UIView alloc] initWithFrame:self.bounds];
    self.interactionView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.interactionView];
    self.interactionView.hidden = !self.isShowInterview;
    [self addSlider];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(controlInteractionView)];
//    [self.interactionView addGestureRecognizer:tap];
}

- (void)controlInteractionView
{
    self.interactionView.hidden = !self.isShowInterview;
    self.isShowInterview = !self.isShowInterview;
}

- (void)dealloc
{
    [self.currentItem removeObserver:self forKeyPath:@"status"];
    [self.currentItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}

@end
