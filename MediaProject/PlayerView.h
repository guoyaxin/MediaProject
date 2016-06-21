//
//  PlayerView.h
//  MediaProject
//
//  Created by CLT on 16/6/6.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerView : UIView

- (id)initWithFrame:(CGRect)frame vedioUrl:(NSString *)vedioUrl;

@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *currentItem;

@property (nonatomic, strong) UIView *interactionView;
@property (nonatomic, strong) UISlider *progressSlider;
@property (nonatomic, assign) id observer;
@end
