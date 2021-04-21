//
//  ViewController.m
//  testMaskAnimation
//
//  Created by iOSzhang Inc on 21/4/21.
//

#import "ViewController.h"
#import "RANewRoomReplayTableViewCell.h"
#import "UIImage+MyImage.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

/// <#Description#>
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:RANewRoomReplayTableViewCell.class forCellReuseIdentifier:ReplayContentCellReuseIdentifier];
    // Do any additional setup after loading the view.
}

- (NSArray *)dataList {
    if (!_dataList) {
        CellModel *model1 = [[CellModel alloc] init];
        model1.titleString = @"大标题";
        model1.contentString = @"内容";
        model1.image = [UIImage imageWithColor:ranCol(1)];
        
        CellModel *model2 = [[CellModel alloc] init];
        model2.titleString = @"来一个长标题来一个长标题来一个长标题来一个长标题来一个长标题来一个长标题";
        model2.contentString = @"来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容来一个长内容";
        model2.image = [UIImage imageWithColor:ranCol(1)];
        
        CellModel *model3 = [[CellModel alloc] init];
        model3.titleString = @"123🤷‍♂️📃";
        model3.contentString = @"123🤷‍♂️📃123🤷‍♂️📃123🤷‍♂️📃";
        model3.image = [UIImage imageWithColor:ranCol(1)];
        
        CellModel *model4 = [[CellModel alloc] init];
        model4.titleString = @"不知道放点啥";
        model4.contentString = @"不知道放点啥不知道放点啥不知道放点啥不知道放点啥";
        model4.image = [UIImage imageWithColor:ranCol(1)];
        
        _dataList = @[model1, model2, model3, model4];
    }
    return _dataList;
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RANewRoomReplayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReplayContentCellReuseIdentifier forIndexPath:indexPath];
    
    cell.cellData = self.dataList[indexPath.row];
    
    return cell;
}

@end
