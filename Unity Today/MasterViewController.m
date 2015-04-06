//
//  MasterViewController.m
//  Unity Today
//
//  Created by Erik Jordan on 5/26/14.
//  Copyright (c) 2014 Erik Jordan. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // LOGO section
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 250)];
    imageView.image = [UIImage imageNamed:@"Logo"];
    self.tableView.tableHeaderView = imageView;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showOrderOfWorship"])
    {
        DetailViewController* controller = segue.destinationViewController;
        controller.detailItem = [NSURL URLWithString:@"https://sites.google.com/a/erik.jordan.name/simple/order-of-worship"];
    }
}

@end
