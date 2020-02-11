//
//  ViewController.m
//  Dealing
//
//  Created by JimLai on 2020/2/9.
//  Copyright © 2020 JimLai. All rights reserved.
//

#import "ViewController.h"

#define kDefualtMargin 20

@interface ViewController ()

@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)setupViews {
    [self.view addSubview:self.label];
    [self.view addSubview:self.slider];
    [self.view addSubview:self.imageView];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view).offset(20);
    }];
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.label);
        make.top.mas_equalTo(self.label.mas_bottom).offset(2);
        make.width.mas_equalTo(self.view).offset(-kDefualtMargin * 2);
        make.height.mas_equalTo(44);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view).offset(-kDefualtMargin * 2);
        make.bottom.mas_equalTo(self.label.mas_top);
    }];
}

-(void)sliderAction:(UISlider *)sender{
    self.label.text = [NSString stringWithFormat:@"来了：%d%%", (int)sender.value];
    if (sender.value <= 10) {
        self.imageView.image = [UIImage imageNamed:@"doing"];
    } else if(sender.value == 100) {
        self.imageView.image = [UIImage imageNamed:@"finished"];
    } else {
        self.imageView.image = nil;
    }
}

- (UILabel *)label{
    if(!_label){
        _label = [[UILabel alloc]init];
        _label.font = [UIFont systemFontOfSize:20];
    }
    return _label;
}

- (UISlider *)slider{
    if(!_slider){
        _slider = [[UISlider alloc]init];
        _slider.minimumValue = 0;
        _slider.maximumValue = 100;
        [_slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

- (UIImageView *)imageView{
    if(!_imageView){
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

@end
