//
//  DetailViewController.m
//  Unity Today
//
//  Created by Erik Jordan on 5/26/14.
//  Copyright (c) 2014 Erik Jordan. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(NSURL*)newDetailItem
{
    if (_detailItem != newDetailItem)
    {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

//	if (self.detailItem) {
//	    self.detailDescriptionLabel.text = [self.detailItem description];
//	}
	
	self.showsNavigationToolbar = YES;
	self.URL = (NSURL*)_detailItem;
	[self load];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	// Clear out the URL so it doesn't reload the URL on reloads
	self.URL = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

@end
