//
//  Giphy.m
//  GiphyViewer
//
//  Created by Mohammed Al-Dahleh on 2018-01-28.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

#import "Giphy.h"

@implementation Giphy

+ (instancetype) giphyWithDictionary:(NSDictionary *) dictionary {
    Giphy *giphy = [[Giphy alloc] init];
    
    if (giphy) {
        giphy.animatedURL = [NSURL URLWithString:[dictionary valueForKeyPath:@"images.original.url"]];
        giphy.stillImageURL = [NSURL URLWithString:[dictionary valueForKeyPath:@"images.downsized_still.url"]];
    }
    
    return giphy;
}

@end
