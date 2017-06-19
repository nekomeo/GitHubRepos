//
//  Repos.m
//  GithubRepos
//
//  Created by Elle Ti on 2017-06-19.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "Repos.h"

@implementation Repos

-(instancetype)initWithName:(NSString *)name url:(NSURL *)url andSize:(NSNumber *)size
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.url = url;
        self.size = size;
    }
    return self;
}

@end
