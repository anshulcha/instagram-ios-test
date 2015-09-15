//
//  PhotosViewController.m
//  Instagram
//
//  Created by Anshul Chaurasia on 9/14/15.
//  Copyright (c) 2015 Anshul Chaurasia. All rights reserved.
//

#import "PhotosViewController.h"
#import "UIImageView+AFNetworking.h"
#import "PhotoCell.h"
#import "PhotoDetailsViewController.h"

@interface PhotosViewController ()

@property (strong, nonatomic) NSArray *instagramPopularData;

@end

@implementation PhotosViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"PhotoCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"com.yahoo.cell"];
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=9e521767ce8c43cfb386e30608eb5f75"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        _instagramPopularData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil][@"data"];
        [self.tableView reloadData];
    }];
    
    self.tableView.rowHeight = 320;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_instagramPopularData count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"com.yahoo.cell"];
    NSString *imageUrl = [[[[_instagramPopularData objectAtIndex:indexPath.row] objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
    [cell.InstagramImageField setImageWithURL:[NSURL URLWithString:imageUrl]];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PhotoDetailsViewController *photoDetailsViewController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    photoDetailsViewController.selectedPhoto = [_instagramPopularData objectAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"photoCellSegue" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
