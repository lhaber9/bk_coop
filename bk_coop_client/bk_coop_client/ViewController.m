//
//  ViewController.m
//  bk_coop_client
//
//  Created by Lucas Haber on 1/13/15.
//  Copyright (c) 2015 bk_coop. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic)IBOutlet UITableView* table;
@property (strong, nonatomic)NSArray* options;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    
    self.options = [NSArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* url = [@"http://localhost:4567/posts?post=" stringByAppendingString:self.options[indexPath.row]];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:url]];
    request.HTTPMethod = @"POST";
    
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.options[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

@end
