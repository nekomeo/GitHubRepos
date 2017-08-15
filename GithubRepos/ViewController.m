//
//  ViewController.m
//  GithubRepos
//
//  Created by Elle Ti on 2017-06-19.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"
#import "Repos.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSMutableArray *repoObjects;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
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
        
        NSMutableArray *repoObjects = [NSMutableArray array];
        
        if (jsonError)
        {
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        for (NSDictionary *repo in repos) // If we reach this point, we have successfully retrieved the JSON from the API for (NSDictionary *repo in repos)
        {
            NSString *repoName = repo[@"name"];
            
            Repos *aRepo = [[Repos alloc] initWithName:repoName];
            [repoObjects addObject:aRepo];
        }
        
        self.repoObjects = repoObjects;
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^(void) {
            [self.tableView reloadData];
        }];
    }];
    
    [dataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repoObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Repos *repo = self.repoObjects[indexPath.row];
    cell.textLabel.text = repo.name;
    return cell;
}
                                      
@end
