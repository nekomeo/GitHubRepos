//
//  Repos.m
//  GithubRepos
//
//  Created by Elle Ti on 2017-06-19.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "Repos.h"

@implementation Repos

-(instancetype)initWithName:(NSString *)name
{
    if (self = [super init])
    {
        self.name = name;
    }
    return self;
}

@end
