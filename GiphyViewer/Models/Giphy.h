//
//  Giphy.h
//  GiphyViewer
//
//  Created by Mohammed Al-Dahleh on 2018-01-28.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Giphy : NSObject

@property (nonatomic, strong) NSURL *stillImageURL;
@property (nonatomic, strong) NSURL *animatedURL;

+ (instancetype) giphyWithDictionary:(NSDictionary *) dictionary;

@end
