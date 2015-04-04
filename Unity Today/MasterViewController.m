//
//  MasterViewController.m
//  Unity Today
//
//  Created by Erik Jordan on 5/26/14.
//  Copyright (c) 2014 Erik Jordan. All rights reserved.
//

#import "QRootElement.h"
#import "QLabelElement.h"
#import "QBooleanElement.h"
#import "QButtonElement.h"
#import "QTextElement.h"

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

// TODO:
// GitHub hosting

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	QRootElement *root = [[QRootElement alloc] init];
	root.title = @"Unity Today";
	root.grouped = YES;
	
	// LOGO section
	QSection *graphic = [[QSection alloc] init];
	graphic.title = @"Sundays";
	UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 250)];
	imageView.image = [UIImage imageNamed:@"Logo"];
	graphic.headerView = imageView;
	[root addSection:graphic];
	
	// SUNDAYS section
	QSection *sundaySection = [[QSection alloc] init];
	sundaySection.title = @"Sundays";
	[root addSection:sundaySection];

	QTextElement *orderOfWorship = [[QTextElement alloc] initWithText:@"Sunday, May 25, 1014"];
	orderOfWorship.title = @"Order of Worship";
	orderOfWorship.controllerAction = @"showOrderOfWorship";
	[sundaySection addElement:orderOfWorship];
	QTextElement* olderOrdersOfWorship = [[QTextElement alloc] init];
	olderOrdersOfWorship.title = @"Past Orders of Worship";
	olderOrdersOfWorship.controllerAction = @"blork";
	[sundaySection addElement:olderOrdersOfWorship];
	QTextElement* upcomingWorship = [[QTextElement alloc] init];
	upcomingWorship.title = @"Upcoming Worship Schedule";
	upcomingWorship.controllerAction = @"blork";
	[sundaySection addElement:upcomingWorship];
	QTextElement* sermonArchives = [[QTextElement alloc] init];
	sermonArchives.title = @"Sermon Archives";
	sermonArchives.controllerAction = @"showArchives";
	[sundaySection addElement:sermonArchives];

	
	// NEWS section
	QSection *newsSection = [[QSection alloc] init];
	newsSection.title = @"News";
	[root addSection:newsSection];

	QTextElement *newsletter = [[QTextElement alloc] initWithText:@"May 2014"];
	newsletter.title = @"Newsletter";
	newsletter.controllerAction = @"showNewsletter";
	[newsSection addElement:newsletter];
	QTextElement *thisWeek = [[QTextElement alloc] initWithText:@"June 15 - 21, 2014"];
	thisWeek.title = @"This Week at Unity";
	thisWeek.controllerAction = @"showThisWeek";
	[newsSection addElement:thisWeek];
	QTextElement *eNews = [[QTextElement alloc] initWithText:@"May 29, 2014"];
	eNews.title = @"E-News e-mail";
	eNews.controllerAction = @"blork";
	[newsSection addElement:eNews];
	
	// GIVE section
	QSection *giveSection = [[QSection alloc] init];
//	giveSection.title = @"";
	[root addSection:giveSection];
	QButtonElement* giveButton = [[QButtonElement alloc] initWithTitle:@"Give Now"];
	[giveSection addElement:giveButton];
	giveButton.controllerAction = @"showGiveScreen";

	self.root = root;
	[self loadView];
}

- (void) showOrderOfWorship
{
	[self performSegueWithIdentifier:@"showDetail" sender:@"https://sites.google.com/a/erik.jordan.name/simple/order-of-worship"];
}

- (void) showNewsletter
{
	[self performSegueWithIdentifier:@"showDetail" sender:@"https://sites.google.com/a/erik.jordan.name/simple/newsletter"];
}

- (void) showThisWeek
{
	[self performSegueWithIdentifier:@"showDetail" sender:@"https://demo.woop.ie/media/gen/76/217/contents.html"];
}

- (void) showArchives
{
	[self performSegueWithIdentifier:@"showArchives" sender:nil];
}

- (void) showGiveScreen
{
	[self performSegueWithIdentifier:@"showGiving" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
		{
        [[segue destinationViewController] setDetailItem:[NSURL URLWithString:sender]];
    }
}

@end
