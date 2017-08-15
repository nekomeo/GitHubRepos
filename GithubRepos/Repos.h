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

-(instancetype)initWithName:(NSString *)name;

@end
