//
//  CollectionViewCell.h
//  GiphyViewer
//
//  Created by Mohammed Al-Dahleh on 2018-01-28.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Giphy;

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) Giphy *giphy;

@end
