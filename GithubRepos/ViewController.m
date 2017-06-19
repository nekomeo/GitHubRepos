//
//  ViewController.m
//  GithubRepos
//
//  Created by Elle Ti on 2017-06-19.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/nekomeo/repos"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if (error)
        {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError)
        {
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        for (NSDictionary *repo in repos) // If we reach this point, we have successfully retrieved the JSON from the API for (NSDictionary *repo in repos)
        {
            NSString *repoName = repo[@"name"];
            NSLog(@"repo: %@", repoName);
        }
    }];
    
    [dataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
