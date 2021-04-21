//
//  RANewRoomReplayTableViewCell.m
//  rabbit
//
//  Created by iOSzhang Inc on 21/3/9.
//  Copyright © 2021 jixiultd. All rights reserved.
//

#import "RANewRoomReplayTableViewCell.h"
#import <Masonry.h>

@implementation CellModel

@end

static CFTimeInterval animationDuration = 0.8f;

@interface RANewRoomReplayTableViewCell ()

/// <#Description#>
@property (nonatomic, strong) UIView *coner;

/// <#Description#>
@property (nonatomic, strong) UIImageView *userImageView;

/// <#Description#>
@property (nonatomic, strong) UILabel *titleLabel;

/// <#Description#>
@property (nonatomic, strong) UILabel *contentLabel;

/// <#Description#>
@property (nonatomic, strong) UIButton *successButton;

/// <#Description#>
@property (nonatomic, strong) UIButton *refuseButton;


/// <#Description#>
@property (nonatomic, strong) UIView *resultConer;

/// 用于做动画的部分
@property (nonatomic) CAShapeLayer *maskLayer;

/// <#Description#>
@property (nonatomic, strong) UIImageView *resultUserImageView;

/// <#Description#>
@property (nonatomic, strong) UILabel *resultTitleLabel;

/// <#Description#>
@property (nonatomic, strong) UILabel *resultContentLabel;

/// <#Description#>
@property (nonatomic, strong) UIImageView *stateImageView;

/// <#Description#>
@property (nonatomic) MASConstraint *labelBottom;

@end

@implementation RANewRoomReplayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)init {
    if (self = [super init]) {
        [self viewInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self viewInit];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self viewInit];
    }
    return self;
}

- (void)viewInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.coner];
    
    [self.coner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-8);
    }];
}

- (UIView *)coner {
    if (!_coner) {
        _coner = [[UIView alloc] init];
        _coner.backgroundColor = colHEX(0xf8f8f8, 1);
        _coner.layer.cornerRadius = 25;
        _coner.clipsToBounds = true;
        
        [_coner addSubview:self.userImageView];
        [_coner addSubview:self.titleLabel];
        [_coner addSubview:self.contentLabel];
        [_coner addSubview:self.successButton];
        [_coner addSubview:self.refuseButton];
        [_coner addSubview:self.resultConer];
        
        [self.resultConer addSubview:self.resultUserImageView];
        [self.resultConer addSubview:self.resultTitleLabel];
        [self.resultConer addSubview:self.resultContentLabel];
        [self.resultConer addSubview:self.stateImageView];
        
        [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(18);
            make.top.mas_equalTo(18);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_userImageView);
            make.left.mas_equalTo(_userImageView.mas_right).mas_offset(10);
            make.right.mas_equalTo(-18);
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_titleLabel);
            make.right.mas_equalTo(-18);
            make.top.mas_equalTo(_titleLabel.mas_bottom).mas_offset(10);
        }];
        [self.successButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_contentLabel.mas_bottom).mas_offset(20);
            make.bottom.mas_equalTo(-20);
            make.size.mas_equalTo(CGSizeMake(67, 27));
            make.left.mas_equalTo(_titleLabel);
        }];
        [self.refuseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_contentLabel.mas_bottom).mas_offset(20);
            make.bottom.mas_equalTo(-20);
            make.size.mas_equalTo(CGSizeMake(67, 27));
            make.left.mas_equalTo(_successButton.mas_right).mas_offset(30);
        }];
        //具体尺寸赋值后应该再次刷新高度
        [self.resultConer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(500, 500));
        }];
        
        [self.resultUserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_userImageView);
        }];
        [self.resultTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_titleLabel);
        }];
        [self.resultContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_contentLabel);
        }];
        [self.stateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(_resultContentLabel.mas_bottom).mas_offset(26);
        }];
    }
    return _coner;
}

- (UIImageView *)userImageView {
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.layer.cornerRadius = 15;
        _userImageView.clipsToBounds = true;
    }
    return _userImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        //高亮部分是666
        _titleLabel.textColor = colHEX(0x999999, 1);
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = colHEX(0x999999, 1);
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UIButton *)successButton {
    if (!_successButton) {
        _successButton = [[UIButton alloc] init];
        [_successButton setImage:[UIImage imageNamed:@"通过"] forState:UIControlStateNormal];
        [_successButton setImage:[UIImage imageNamed:@"通过"] forState:UIControlStateHighlighted];
        [_successButton setBackgroundColor:colHEX(0x02C160,1)];
        _successButton.layer.cornerRadius = 6;
        [_successButton addTarget:self action:@selector(successButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_successButton expandResponseAreaBounds:UIEdgeInsetsMake(10, 10, 10, 10)];
    }
    return _successButton;
}

- (UIButton *)refuseButton {
    if (!_refuseButton) {
        _refuseButton = [[UIButton alloc] init];
        [_refuseButton setImage:[UIImage imageNamed:@"拒绝"] forState:UIControlStateNormal];
        [_refuseButton setImage:[UIImage imageNamed:@"拒绝"] forState:UIControlStateHighlighted];
        [_refuseButton setBackgroundColor:colHEX(0xE85A5A, 1)];
        _refuseButton.layer.cornerRadius = 6;
        [_refuseButton addTarget:self action:@selector(refuseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refuseButton;
}

- (UIView *)resultConer {
    if (!_resultConer) {
        _resultConer = [[UIView alloc] init];
        
        _resultConer.hidden = true;
        
        CGFloat finishWH = hypot(CGRectGetWidth(self.coner.frame), CGRectGetHeight(self.coner.frame));
        
        UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 0, 0) cornerRadius:0];
        //贝塞尔曲线 画一个圆形
        [bpath appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(finishWH/2, finishWH/2) radius:finishWH/2 startAngle:0 endAngle:2*M_PI clockwise:NO]];
        
        //创建一个CAShapeLayer 图层
        self.maskLayer = [CAShapeLayer layer];
        self.maskLayer.path = bpath.CGPath;
        _resultConer.layer.mask = self.maskLayer;
    }
    return _resultConer;
}

- (UIImageView *)resultUserImageView {
    if (!_resultUserImageView) {
        _resultUserImageView = [[UIImageView alloc] init];
        _resultUserImageView.layer.cornerRadius = 15;
        _resultUserImageView.clipsToBounds = true;
    }
    return _resultUserImageView;
}

- (UILabel *)resultTitleLabel {
    if (!_resultTitleLabel) {
        _resultTitleLabel = [[UILabel alloc] init];
        _resultTitleLabel.textColor = [UIColor whiteColor];
        _resultTitleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _resultTitleLabel;
}

- (UILabel *)resultContentLabel {
    if (!_resultContentLabel) {
        _resultContentLabel = [[UILabel alloc] init];
        _resultContentLabel.textColor = [UIColor whiteColor];
        _resultContentLabel.font = [UIFont systemFontOfSize:14];
        _resultContentLabel.numberOfLines = 0;
    }
    return _resultContentLabel;
}

- (UIImageView *)stateImageView {
    if (!_stateImageView) {
        _stateImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"通过"] highlightedImage:[UIImage imageNamed:@"拒绝"]];
    }
    return _stateImageView;
}

- (IBAction)successButtonClick:(UIButton *)sender {
    [self updateSuccess:true];
}

- (IBAction)refuseButtonClick:(UIButton *)sender {
    [self updateFeild:true];
}

/// 刷新同意
- (void)updateSuccess:(BOOL)animation {
    self.resultConer.hidden = false;
    self.resultConer.backgroundColor = colHEX(0x02C160, 1);
    self.stateImageView.highlighted = false;
    
    if (animation) {
        CABasicAnimation *theAnimation;
        theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
        theAnimation.duration=animation?animationDuration:0.1f;
        theAnimation.fromValue = [NSNumber numberWithFloat:0.0001];
        theAnimation.toValue = [NSNumber numberWithFloat:1];
        
        CABasicAnimation *postionAni = [CABasicAnimation animationWithKeyPath:@"position"];
        postionAni.duration = animation?animationDuration:0.1f;
        //位置
        CGPoint successButtonCenter = [self.resultConer convertPoint:self.successButton.center fromView:self.coner];
        postionAni.fromValue = [NSValue valueWithCGPoint:successButtonCenter];
        postionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
        
        //组动画
        CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
        groupAnimation.animations = [NSArray arrayWithObjects:theAnimation,postionAni, nil];
        groupAnimation.duration = animation?animationDuration:0.1f;
        groupAnimation.removedOnCompletion = NO;
        groupAnimation.fillMode=kCAFillModeForwards;
        
        [self.maskLayer addAnimation:groupAnimation forKey:@"groupAnimation"];
    }
}

/// 刷新拒绝
- (void)updateFeild:(BOOL)animation {
    self.resultConer.hidden = false;
    self.resultConer.backgroundColor =
    colHEX(0xE85A5A, 1);
    self.stateImageView.highlighted = true;
    
    if (animation) {
        CABasicAnimation *theAnimation;
        theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
        theAnimation.duration=animation?animationDuration:0.1f;
        //        theAnimation.speed = 0.;
        theAnimation.removedOnCompletion = NO;
        theAnimation.fillMode=kCAFillModeForwards;
        theAnimation.fromValue = [NSNumber numberWithFloat:0.0001];
        theAnimation.toValue = [NSNumber numberWithFloat:1];
        
        CABasicAnimation *postionAni = [CABasicAnimation animationWithKeyPath:@"position"];
        postionAni.duration = animation?animationDuration:0.1f;
        postionAni.removedOnCompletion = NO;
        postionAni.fillMode=kCAFillModeForwards;
        CGPoint successButtonCenter = [self.resultConer convertPoint:self.refuseButton.center fromView:self.coner];
        postionAni.fromValue = [NSValue valueWithCGPoint:successButtonCenter];
        postionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
        
        //组动画
        CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
        groupAnimation.animations = [NSArray arrayWithObjects:theAnimation,postionAni, nil];
        groupAnimation.duration = animation?animationDuration:0.1f;
        groupAnimation.removedOnCompletion = NO;
        groupAnimation.fillMode=kCAFillModeForwards;
        
        [self.maskLayer addAnimation:groupAnimation forKey:@"groupAnimation"];
    }
}

- (void)setCellData:(CellModel *)cellData {
    _cellData = cellData;

    self.stateImageView.hidden = false;
    self.refuseButton.hidden = false;
    self.successButton.hidden = false;
    
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLabel);
        make.right.mas_equalTo(-18);
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_offset(10);
    }];
    [self.successButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contentLabel.mas_bottom).mas_offset(20);
        make.bottom.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(67, 27));
        make.left.mas_equalTo(_titleLabel);
    }];
    [self.refuseButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contentLabel.mas_bottom).mas_offset(20);
        make.bottom.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(67, 27));
        make.left.mas_equalTo(_successButton.mas_right).mas_offset(30);
    }];
    
    self.userImageView.image = cellData.image;
    self.resultUserImageView.image = cellData.image;
    self.titleLabel.text = cellData.titleString;
    self.resultTitleLabel.text = self.titleLabel.text;
    self.contentLabel.text = cellData.contentString;
    self.resultContentLabel.text = self.contentLabel.text;

    [self layoutIfNeeded];

    self.resultConer.hidden = true;
}

- (void)drawRect:(CGRect)rect {
    //只有drawRect中才会获取到正确的宽高，此时再计算宽高
    CGFloat finishWH = hypot(CGRectGetWidth(self.coner.frame), CGRectGetHeight(self.coner.frame));
    [self.resultConer mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(finishWH, finishWH));
        make.center.mas_equalTo(0);
    }];
    UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 0, 0) cornerRadius:0];
    //贝塞尔曲线 画一个圆形
    [bpath appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(finishWH/2, finishWH/2) radius:finishWH/2 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    self.maskLayer.path = bpath.CGPath;
    
    [super drawRect:rect];
}

@end
