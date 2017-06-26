//
//  RootViewController.m
//  ShangChengShouYe
//
//  Created by DaLei on 2017/6/26.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "RootViewController.h"
#import "SDCycleScrollView.h"
#import "MenuCollectionViewController.h"
#import "GridCollectionViewController.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "HaoWuTableViewCell.h"
#import "HaoJiaTableViewCell.h"


#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width

@interface RootViewController ()<SDCycleScrollViewDelegate>

//Banner广告
@property(nonatomic,strong) SDCycleScrollView *bannerAd;
//九宫格
@property(nonatomic,strong) MenuCollectionViewController *menuVC;
//滚动文字广告
@property(nonatomic,strong) SDCycleScrollView *textAd;
//推荐产品，可以使用CollectionView，也可以直接自定义一个UIView更简单一些。
@property(nonatomic,strong) GridCollectionViewController *gridVC;
//cell图片
@property(nonatomic,strong) NSArray *cellImage;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor colorWithRed:(237)/255.0 green:(237)/255.0 blue:(237)/255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 懒加载

-(SDCycleScrollView *)bannerAd {
    
    NSArray *imagesURLStrings = @[@"http://eimg.smzdm.com/201706/21/5949c794a058193.png",
                                  @"http://eimg.smzdm.com/201706/20/594872b3ce4897616.png",
                                  @"http://eimg.smzdm.com/201706/21/5949c759c9ec75211.png",
                                  @"http://eimg.smzdm.com/201706/20/59490304c13471312.jpg",
                                  @"http://eimg.smzdm.com/201706/20/5948c8333d5242625.png"];
    
    if (!_bannerAd) {
        _bannerAd = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) delegate:self placeholderImage:[UIImage imageNamed:@"default"]];
        _bannerAd.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _bannerAd.currentPageDotColor = [UIColor whiteColor];
        _bannerAd.imageURLStringsGroup = imagesURLStrings;
    }
    
    return _bannerAd;
}

-(MenuCollectionViewController *)menuVC {
    
    if (!_menuVC) {
        _menuVC = [MenuCollectionViewController new];
    }
    return _menuVC;
}

-(SDCycleScrollView *)textAd {
    if (!_textAd) {
        
        NSArray *textStrings = @[@"纯文字上下滚动轮播，纯文字上下滚动轮播1",
                                 @"纯文字上下滚动轮播，纯文字上下滚动轮播2",
                                 @"纯文字上下滚动轮播，纯文字上下滚动轮播3",
                                 @"纯文字上下滚动轮播，纯文字上下滚动轮播4"];
        _textAd = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(62, 0, SCREEN_WIDTH-62, 40) delegate:self placeholderImage:nil];
        _textAd.scrollDirection = UICollectionViewScrollDirectionVertical;
        _textAd.onlyDisplayText = YES;
        _textAd.titlesGroup = textStrings;
        _textAd.titleLabelTextColor = [UIColor darkTextColor];
        _textAd.titleLabelBackgroundColor = [UIColor whiteColor];
        
    }
    
    return _textAd;
}

-(GridCollectionViewController *)gridVC {
    
    if (!_gridVC) {
        _gridVC = [GridCollectionViewController new];
        NSArray *arr = @[@"http://eimg.smzdm.com/201706/24/594dcc71cdca59038.png",
                         @"http://eimg.smzdm.com/201706/23/594c69eaeb83e2393.png",
                         @"http://eimg.smzdm.com/201703/06/58bd4104c7076804.png",
                         @"http://eimg.smzdm.com/201706/24/594dcc357b2f0503.png",
                         @"http://tp-y.zdmimg.com/201706/26/58730c28245868912.jpg_d200.jpg",
                         @"http://tp-y.zdmimg.com/201706/26/5950acb0c4f3c5734.jpg_d200.jpg",
                         @"http://tp-y.zdmimg.com/201706/26/5950b007443aa3177.jpg_d200.jpg",
                         @"http://tp-y.zdmimg.com/201706/26/5950af832580a4674.jpg_d200.jpg"];
        _gridVC.images = arr;
    }
    return _gridVC;
}

-(NSArray *)cellImage{
    if (!_cellImage) {
        _cellImage = @[@"http://tp-y.zdmimg.com/201706/26/5950ada8d12b16874.jpg_d200.jpg",
                       @"https://qnam.smzdm.com/201706/18/59469fc7f37c9259.jpg_c640.jpg",
                       @"http://tp-y.zdmimg.com/201706/26/5950a852103e32944.jpg_d200.jpg",
                       @"https://qnam.smzdm.com/201706/20/5948c87358e411666.jpg_b320.jpg",
                       @"http://tp-y.zdmimg.com/201612/21/58177ab5aece8.jpeg_d200.jpg",
                       @"https://qnam.smzdm.com/201706/17/5944a85195c473232.jpg_c640.jpg",
                       @"http://tp-y.zdmimg.com/201706/26/59507e5cccf589711.jpg_d200.jpg",
                       @"https://qnam.smzdm.com/201706/11/593d3e34642a54310.jpg_c640.jpg",
                       @"http://tp-y.zdmimg.com/201706/26/5718a1b52dc03.jpeg_d200.jpg",
                       @"https://qnam.smzdm.com/201706/20/59493a5c728ae7142.jpg_c640.jpg"];
    }
    return _cellImage;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 180;
    }
    else if (section == 1) {
        return 150;
    }
    else if (section == 2) {
        return 40;
    }
    else if (section == 3) {
        return 118;
    }
    else if (section == 4) {
        return 28;
    }
    else if (section == 5) {
        return SCREEN_WIDTH*0.75;
    }
    else if (section == 6) {
        return 28;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.bannerAd;
    }
    if (section == 1) {
        return self.menuVC.view;
    }
    if (section == 2) {
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        v.backgroundColor = [UIColor whiteColor];
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 52, 20)];
        [img setImage:[UIImage imageNamed:@"homePage_headline"]];
        [v addSubview:img];
        [v addSubview:self.textAd];
        return v;
    }
    if (section == 3) {
        NSURL *url = [NSURL URLWithString:@"http://eimg.smzdm.com/201706/26/59506edd8f08e3564.png"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 118)];
        [button sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"default"]];
        return button;
    }
    if (section == 4) {
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 28)];
        titleView.backgroundColor = [UIColor clearColor];
        UIView *tagView = [[UIView alloc]initWithFrame:CGRectMake(10, 9, 4, 9)];
        tagView.backgroundColor = [UIColor redColor];
        [titleView addSubview:tagView];
        UILabel *tagLab = [[UILabel alloc]initWithFrame:CGRectMake(24, 9, SCREEN_WIDTH-24, 9)];
        [tagLab setText:@"精选"];
        [titleView addSubview:tagLab];
        return titleView;
    }
    if (section == 5) {
        return self.gridVC.view;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 7) {
        return 10;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2==0) {
        return 171;
    } else {
        return 225;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier1 = @"HaoJiaTableViewCell";
    static NSString *cellIdentifier2 = @"HaoWuTableViewCell";
    if (indexPath.row%2==0) {
        HaoJiaTableViewCell *cell = (HaoJiaTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HaoJiaTableViewCell" owner:self options:nil] lastObject];
        }
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[self.cellImage objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"default"]];
        return cell;
    } else {
        HaoWuTableViewCell *cell = (HaoWuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HaoWuTableViewCell" owner:self options:nil] lastObject];
        }
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[self.cellImage objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"default"]];
        return cell;
    }
}

@end
