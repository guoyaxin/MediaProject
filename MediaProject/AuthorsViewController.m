//
//  AuthorsViewController.m
//  MediaProject
//
//  Created by CLT on 16/5/26.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "AuthorsViewController.h"
#import "AuthorModel.h"
#import "AuthorTableViewCell.h"
#import "VediosViewController.h"

@interface AuthorsViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *authorTypeSegment;
@property (strong, nonatomic) IBOutlet UIScrollView *backgroundScrollView;
@property (strong, nonatomic) IBOutlet UITableView *dotaTableView;
@property (strong, nonatomic) IBOutlet UITableView *lolTableView;

@property (strong, nonatomic) NSMutableArray *dotaAllAuthors;
@property (strong, nonatomic) NSMutableArray *lolAllAuthors;
@property (assign, nonatomic) VedioType vedioType;

@end

@implementation AuthorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主播";
    self.dotaAllAuthors = [NSMutableArray array];
    self.lolAllAuthors = [NSMutableArray array];
    [self.dotaTableView registerNib:[UINib nibWithNibName:@"AuthorTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AutorTableViewCell_Identify];
    [self.lolTableView registerNib:[UINib nibWithNibName:@"AuthorTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AutorTableViewCell_Identify];
    self.dotaTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.lolTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dotaTableView.rowHeight = 63;
    self.lolTableView.rowHeight = 63;
    [self requestDotaAllAuthors];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.rootTabVC.myTabbar.hidden = NO;
}

- (void)requestDotaAllAuthors
{
    __weak typeof(self)  weakSelf = self;
    MediaRequest *mediaRequest = [[MediaRequest alloc]init];
    [mediaRequest getDotaAllAnchorListSuccess:^(NSArray *arr) {
        [weakSelf.dotaAllAuthors addObjectsFromArray:arr];
        [weakSelf.dotaAllAuthors sortUsingComparator:^NSComparisonResult(AuthorModel *obj1, AuthorModel *obj2) {
            if (obj1.pop < obj2.pop) {
                return NSOrderedAscending;
            }
            else if (obj1.pop > obj2.pop) {
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        }];
        
        [weakSelf.dotaTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void)requestLOLAllAuthors
{
    __weak typeof(self) weakself = self;
    MediaRequest *mediaRequest = [[MediaRequest alloc] init];
    [mediaRequest getLoLAllAnchorsListSuccess:^(NSArray *arr) {
        [weakself.lolAllAuthors removeAllObjects];
        [weakself.lolAllAuthors addObjectsFromArray:arr];
        [weakself.lolAllAuthors sortUsingComparator:^NSComparisonResult(AuthorModel *obj1, AuthorModel *obj2) {
            if (obj1.pop < obj2.pop) {
                return NSOrderedAscending;
            }
            else if (obj1.pop > obj2.pop) {
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        }];
        [weakself.lolTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (IBAction)segmentValueChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.backgroundScrollView.contentOffset = CGPointMake(0, 0);
        self.vedioType = VedioType_Dota;
    }
    else {
        if (self.lolAllAuthors.count == 0) {
            [self requestLOLAllAuthors];
        }
        self.backgroundScrollView.contentOffset = CGPointMake(WindownWidth, 0);
        self.vedioType = VedioType_LOL;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.backgroundScrollView) {
        CGPoint point = scrollView.contentOffset;
        if (point.x >= WindownWidth) {
            if (self.lolAllAuthors.count == 0) {
                [self requestLOLAllAuthors];
                self.authorTypeSegment.selectedSegmentIndex = 1;
                self.vedioType = VedioType_LOL;
            }
        }
        else {
            self.authorTypeSegment.selectedSegmentIndex = 0;
            self.vedioType = VedioType_Dota;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.dotaTableView) {
        return self.dotaAllAuthors.count;
    }
    return self.lolAllAuthors.count;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AuthorTableViewCell *cell = (AuthorTableViewCell *)[tableView dequeueReusableCellWithIdentifier:AutorTableViewCell_Identify];
    if (tableView == self.dotaTableView) {
        cell.authorModel = self.dotaAllAuthors[indexPath.row];
    }
    else {
        cell.authorModel = self.lolAllAuthors[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AuthorModel *model = [[AuthorModel alloc] init];
    if (tableView == self.dotaTableView) {
        model = self.dotaAllAuthors[indexPath.row];
    }
    else {
        model = self.lolAllAuthors[indexPath.row];
    }
    UIStoryboard *bord = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    VediosViewController *vedioVC = [bord instantiateViewControllerWithIdentifier:@"VediosViewController"];
    vedioVC.authorModel = model;
    vedioVC.vedioType = self.vedioType;
    self.rootTabVC.myTabbar.hidden = YES;
    [self.navigationController pushViewController:vedioVC animated:YES];
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
