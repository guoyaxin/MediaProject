//
//  PlayerView.m
//  MediaProject
//
//  Created by CLT on 16/6/6.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "PlayerView.h"
#import <AVFoundation/AVFoundation.h>

@implementation PlayerView

- (id)initWithFrame:(CGRect)frame vedioUrl:(NSString *)vedioUrl observer:(id)observer
{
    self = [super init];
    self.frame = frame;
    self.backgroundColor = [UIColor blackColor];
    _currentItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:vedioUrl]];
    _player = [AVPlayer playerWithPlayerItem:_currentItem];
    //每个layer都有个player，真正播放视频的是这个layer的player
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.frame = self.layer.bounds;
    [_currentItem addObserver:observer forKeyPath:@"status" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [self.layer addSublayer:_playerLayer];
    return self;
}

- (void)removeObserver:(NSObject *)observer
{
    [_currentItem removeObserver:observer forKeyPath:@"status"];
}

@end
