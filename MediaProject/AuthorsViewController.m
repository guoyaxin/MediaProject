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

@interface AuthorsViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *authorTypeSegment;
@property (strong, nonatomic) IBOutlet UIScrollView *backgroundScrollView;
@property (strong, nonatomic) IBOutlet UITableView *dotaTableView;
@property (strong, nonatomic) IBOutlet UITableView *lolTableView;

@property (strong, nonatomic) NSMutableArray *dotaAllAuthors;
@property (strong, nonatomic) NSMutableArray *lolAllAuthors;

@end

@implementation AuthorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    self.dotaAllAuthors = [NSMutableArray array];
    self.lolAllAuthors = [NSMutableArray array];
    [self.dotaTableView registerNib:[UINib nibWithNibName:@"AuthorTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AutorTableViewCell_Identify];
    [self.lolTableView registerNib:[UINib nibWithNibName:@"AuthorTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AutorTableViewCell_Identify];
    self.dotaTableView.rowHeight = 63;
    self.lolTableView.rowHeight = 63;
    [self requestDotaAllAuthors];
}

- (void)requestDotaAllAuthors
{
    MediaRequest *mediaRequest = [[MediaRequest alloc]init];
    [mediaRequest getDotaAllAnchorListSuccess:^(NSArray *arr) {
        [self.dotaAllAuthors addObjectsFromArray:arr];
        NSLog(@"dota Arr = %@", self.dotaAllAuthors);
        [self.dotaTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void)requestLOLAllAuthors
{
    MediaRequest *mediaRequest = [[MediaRequest alloc] init];
    [mediaRequest getLoLAllAnchorsListSuccess:^(NSArray *arr) {
        [self.lolAllAuthors addObjectsFromArray:arr];
        [self.lolTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (IBAction)segmentValueChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.backgroundScrollView.contentOffset = CGPointMake(0, 0);
    }
    else {
        if (self.lolAllAuthors.count == 0) {
            [self requestLOLAllAuthors];
        }
        self.backgroundScrollView.contentOffset = CGPointMake(WindownWidth, 0);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.x >= WindownWidth) {
        if (self.lolAllAuthors.count == 0) {
            [self requestLOLAllAuthors];
        }
    }
    NSLog(@"point = %@", NSStringFromCGPoint(point));
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
