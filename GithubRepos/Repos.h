//
//  Repos.h
//  GithubRepos
//
//  Created by Elle Ti on 2017-06-19.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repos : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSURL *url;
@property (nonatomic) NSNumber *size;

-(instancetype)initWithName:(NSString *)name url:(NSURL *)url andSize:(NSNumber *)size;

@end
