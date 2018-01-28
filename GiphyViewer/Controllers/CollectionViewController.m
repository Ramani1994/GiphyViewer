//
//  CollectionViewController.m
//  GiphyViewer
//
//  Created by Mohammed Al-Dahleh on 2018-01-28.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

#import "CollectionViewController.h"
#import "DetailViewController.h"
#import "CollectionViewCell.h"
#import "Giphy.h"

@interface CollectionViewController ()
@property (nonatomic, strong) NSMutableArray *giphys;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"GIFViewerCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refreshImages];
}

- (void) refreshImages {
    self.giphys = [NSMutableArray array];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC&rating=pg"];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSArray *dictionaries = [dictionary valueForKey:@"data"];
        for (NSDictionary *dict in dictionaries) {
            Giphy *giphy = [Giphy giphyWithDictionary:dict];
            [self.giphys addObject:giphy];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
    
    [task resume];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *selectedPath = [self.collectionView indexPathsForSelectedItems][0];
        
        Giphy *giphy = self.giphys[selectedPath.row];
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.giphy = giphy;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.giphys count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.giphy = [self.giphys objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

@end
