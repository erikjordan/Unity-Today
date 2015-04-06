//
//  DetailViewController.h
//  Unity Today
//
//  Created by Erik Jordan on 5/26/14.
//  Copyright (c) 2014 Erik Jordan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PBWebViewController.h"

@interface DetailViewController : PBWebViewController

@property (strong, nonatomic) NSURL* detailItem;

@end
