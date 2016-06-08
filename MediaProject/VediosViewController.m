//
//  VediosViewController.m
//  MediaProject
//
//  Created by CLT on 16/6/2.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "VediosViewController.h"
#import "VedioCollectionViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "VedioDetailModel.h"
#import "PlayerView.h"

@interface VediosViewController ()<VedioCollectionViewCellDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *vedioCollectionView;
@property (strong, nonatomic) NSMutableArray *vedios;
@property (assign, nonatomic) BOOL isSignleRow;
@property (strong, nonatomic) AVPlayer *player;
@property (copy, nonatomic) AVPlayerItem *playerItem;
@property (assign, nonatomic) BOOL isPlaying;
@property (strong, nonatomic) PlayerView *playerView;

@property (strong, nonatomic) VedioCollectionViewCell *currentCell;
@property (assign, nonatomic) NSIndexPath *currentPath;
@property (assign, nonatomic) BOOL cellShouldShow;
@property (assign, nonatomic) BOOL isOnCell;
@property (assign, nonatomic) BOOL isOnWindow;
@end

@implementation VediosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    self.isPlaying = NO;
    self.isSignleRow = NO;
    self.cellShouldShow = NO;
    self.isOnCell = YES;
    self.isOnWindow = YES;
    self.vedios = [NSMutableArray array];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize =CGSizeMake(self.view.bounds.size.width/2.0, 140);
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing = 0.0;
    self.vedioCollectionView.collectionViewLayout = layout;
    [self.vedioCollectionView registerNib:[UINib nibWithNibName:@"VedioCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:VedioCollectionViewCell_Identify];
    [self requestVedios];
    [self addShowTypeItem];
}

- (void)requestVedios
{
    __weak typeof(self) weakSelf = self;
    MediaRequest *request = [[MediaRequest alloc] init];
    [request getDotaSignleAnchorVediosWithAuthor:self.authorModel.authorId vedioLimit:100 success:^(NSArray *arr) {
        [weakSelf.vedios addObjectsFromArray:arr];
        [weakSelf.vedioCollectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void)addShowTypeItem
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(changeShowType)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)changeShowType
{
    self.isSignleRow = !self.isSignleRow;
    [self.vedioCollectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.vedios.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isSignleRow) {
        return CGSizeMake(WindownWidth, 180);
    }
    return CGSizeMake(WindownWidth/2.0, 140);
}

//设置每个item水平间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 0.0;
//}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VedioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:VedioCollectionViewCell_Identify forIndexPath:indexPath];
    cell.delegate = self;
    cell.vedioModel = self.vedios[indexPath.row];
    if (self.isSignleRow) {
        cell.type = 0;
    }
    else {
        cell.type = 1;
    }
    NSArray *visibleIndexpaths = [self.vedioCollectionView indexPathsForVisibleItems];
    if ([visibleIndexpaths containsObject:self.currentPath]) {
        self.cellShouldShow = YES;
    }
    else {
        self.cellShouldShow = NO;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    VedioCollectionViewCell *vedioCell = (VedioCollectionViewCell *)cell;
    if (self.isPlaying) {
        [self.player pause];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.isSignleRow) {
     //进入一个新的界面播放视频
    }
}

- (void)vedioCollectionViewPlayBtnClicked:(VedioCollectionViewCell *)cell
{
    if (self.playerView) {
        [self.playerView removeFromSuperview];
        self.isOnCell = NO;
    }
    VedioModel *model = cell.vedioModel;
    self.currentCell = cell;
    self.currentPath = [self.vedioCollectionView indexPathForCell:cell];
    __weak typeof(self) weakSelf = self;
    MediaRequest *request = [[MediaRequest alloc] init];

    if (self.vedioType == VedioType_Dota) {
        [request getDotaSignleVedioWithType:@"mp4" vedioId:model.vedioId success:^(NSDictionary *dic) {
            VedioDetailModel *detailModel = [[VedioDetailModel alloc]
            init];
            [detailModel setValuesForKeysWithDictionary:dic];
            NSLog(@"vedio Dic = %@", dic);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.playerView = [[PlayerView alloc] initWithFrame:cell.bounds vedioUrl:detailModel.url observer:weakSelf];
                //            [cell addSubview:weakSelf.playerView];
                [cell.contentView addSubview:weakSelf.playerView];
                [cell.contentView bringSubviewToFront:weakSelf.playerView];
                self.isOnCell = YES;
                self.isOnWindow = NO;
 
            });
           //            cell.cellPlayer = weakSelf.player;
        } failure:^(NSError *error) {
            
        }];
    }
    else {
        [request getLoLSignleVedioWithType:@"mp4" vedioId:model.vedioId success:^(NSDictionary *dic) {
            
        } failure:^(NSError *error) {
            
        }];
    }

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayerStatusReadyToPlay");
            [self.playerView.player play];
            self.isPlaying = YES;
        } else if ([playerItem status] == AVPlayerStatusFailed) {
            NSLog(@"AVPlayerStatusFailed");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
//        NSTimeInterval timeInterval = [self availableDuration];// 计算缓冲进度
//        NSLog(@"Time Interval:%f",timeInterval);
//        CMTime duration = self.playerItem.duration;
//        CGFloat totalDuration = CMTimeGetSeconds(duration);
//        [self.videoProgress setProgress:timeInterval / totalDuration animated:YES];
    }
}


- (NSString *)convertTime:(CGFloat)second{
    NSDate *d = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (second/3600 >= 1) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"mm:ss"];
    }
    NSString *showtimeNew = [formatter stringFromDate:d];
    return showtimeNew;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView == self.vedioCollectionView){
        if (_playerView == nil) {
            return;
        }
        //如果划出去了，我们就缩小放到右下角
        CGRect currentCellRect = [self.vedioCollectionView convertRect:self.currentCell.frame toView:self.view];
//        NSLog(@"indexPath = %@", self.currentPath);
        NSLog(@"currentCellRect = %@", NSStringFromCGRect(currentCellRect));
        NSLog(@"self.currentcell.frame.size.heigt = %f", -self.currentCell.frame.size.height);
        if (currentCellRect.origin.y < -self.currentCell.frame.size.height + 64 || currentCellRect.origin.y > self.view.bounds.size.height) {
            //|| currentCellRect.origin.y > self.view.bounds.size.height
            //放到windows上
            [self putToWindow];
        }
        else {
            //如果划进来了的话，我们继续放到cell上播放
            if (self.cellShouldShow) {
                [self backToCell];
            }
            else {
                
            }
            
        }
  
    }
}


- (void)putToWindow
{
    if (!self.isOnWindow) {
//        CGRect playerViewFrameInSelfView = [self.vedioCollectionView convertRect:self.playerView.frame toView:self.view];
//        self.playerView.frame = playerViewFrameInSelfView;
        [self.playerView removeFromSuperview];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.playerView.frame = CGRectMake(WindownWidth/2,WindowHeight-(WindowHeight/2)*0.75, WindownWidth/2, (WindowHeight/2)*0.75);
            self.playerView.playerLayer.frame = self.playerView.bounds;
            [[UIApplication sharedApplication].keyWindow addSubview:self.playerView];
            self.isOnWindow = YES;
            self.isOnCell = NO;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)backToCell
{
    if (!self.isOnCell) {
        [self.playerView removeFromSuperview];
        [UIView animateWithDuration:0.5f animations:^{
            self.playerView.frame = self.currentCell.bounds;
            self.playerView.playerLayer.frame =  self.playerView.bounds;
            [self.currentCell.contentView addSubview:self.playerView];
            self.isOnCell = YES;
            self.isOnWindow = NO;
            //        [currentCell.backgroundIV addSubview:wmPlayer];
            //        [currentCell.backgroundIV bringSubviewToFront:wmPlayer];
            
            
            
        }completion:^(BOOL finished) {
            
        }];

    }
}
- (void)dealloc
{
    [self.playerView removeObserver:self forKeyPath:@"status"];
//    [self.playerView removeObserver:self forKeyPath:@"loadedTimeRanges"];
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
