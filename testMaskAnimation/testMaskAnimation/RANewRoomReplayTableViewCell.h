//
//  RANewRoomReplayTableViewCell.h
//  rabbit
//
//  Created by iOSzhang Inc on 21/3/9.
//  Copyright © 2021 jixiultd. All rights reserved.
//

#import <UIKit/UIKit.h>

/*随机色
 */
#define ranCol(alph) [UIColor colorWithRed:(arc4random() % 256) / 256.0 green:(arc4random() % 256) / 256.0 blue:(arc4random() % 256) / 256.0 alpha:alph]
/*R,G,B    请使用256色，即0~255
 * A            透明度，0~1
 */
#define colRGB(R,G,B,A) [UIColor colorWithRed:R / 256.0 green:G / 256.0 blue:B / 256.0 alpha:A]
/**
 hex色值转换
 
 @param rgbValue hex色值，使用0x开头
 @param alpha 透明度
 @return 最终色值
 */
#define colHEX(rgbValue, A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]

NS_ASSUME_NONNULL_BEGIN

@interface CellModel : NSObject

/// <#Description#>
@property (nonatomic, strong) UIImage *image;

/// <#Description#>
@property (nonatomic, copy) NSString *titleString;

/// <#Description#>
@property (nonatomic, copy) NSString *contentString;

@end

static NSString *ReplayContentCellReuseIdentifier = @"RANewRoomReplayTableViewCell";

@interface RANewRoomReplayTableViewCell : UITableViewCell

/// <#Description#>
@property (nonatomic, strong) CellModel *cellData;

/// 刷新同意
- (void)updateSuccess:(BOOL)animation;

/// 刷新拒绝
- (void)updateFeild:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END
