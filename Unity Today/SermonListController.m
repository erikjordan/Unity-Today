//
//  SermonListController.m
//  Unity Today
//
//  Created by Erik Jordan on 6/18/14.
//  Copyright (c) 2014 Erik Jordan. All rights reserved.
//

#import "SermonListController.h"
#import "DetailViewController.h"

@interface SermonListController ()

@end

@implementation SermonListController

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	[[segue destinationViewController] setDetailItem:[NSURL URLWithString:@"http://hwcdn.libsyn.com/p/4/e/8/4e838197b7f9c299/All_the_Difference_Rev._Rob_Eller-Isaacs_June_15_2014.mp3?c_id=7288849&expiration=1403148109&hwt=78609881c7cb62695aeb6a7b08a641f5"]];
}

@end
