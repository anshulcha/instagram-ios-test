//
//  PhotoDetailsViewController.m
//  Instagram
//
//  Created by Anshul Chaurasia on 9/14/15.
//  Copyright (c) 2015 Anshul Chaurasia. All rights reserved.
//

#import "PhotoDetailsViewController.h"

@interface PhotoDetailsViewController ()

//@property (strong, nonatomic) NSDictionary *selectedPhoto;

@end

@implementation PhotoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"New page %@", _selectedPhoto);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(<#NSString *format, ...#>)
}


@end
