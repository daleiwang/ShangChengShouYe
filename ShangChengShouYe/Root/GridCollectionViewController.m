//
//  GridCollectionViewController.m
//  DMV1
//
//  Created by DaLei on 2017/6/26.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "GridCollectionViewController.h"
#import "GridCollectionViewLayout.h"
#import "GridCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface GridCollectionViewController ()

@end

@implementation GridCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
    GridCollectionViewLayout *grid = [GridCollectionViewLayout new];
    return [super initWithCollectionViewLayout:grid];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GridCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[self.images objectAtIndex:indexPath.item]] placeholderImage:[UIImage imageNamed:@"default_640x320"]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"------%zd", indexPath.section);
    NSLog(@"------%zd", indexPath.item);
}

@end
