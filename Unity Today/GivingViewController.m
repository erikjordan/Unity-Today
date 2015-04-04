//
//  GivingViewController.m
//  Unity Today
//
//  Created by Erik Jordan on 6/24/14.
//  Copyright (c) 2014 Erik Jordan. All rights reserved.
//

#import "GivingViewController.h"
#import "QRootElement.h"
#import "QSegmentedElement.h"
#import "QButtonElement.h"
#import "QRadioSection.h"
#import "DetailViewController.h"

@interface GivingViewController ()

@property QSegmentedElement* recipient;
@property QSection* recipientSection;

@end

@implementation GivingViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	QRootElement *root = [[QRootElement alloc] init];
	root.title = @"Give Today";
	root.grouped = YES;
	
	// RECIPIENT section
	self.recipientSection = [[QSection alloc] init];
	self.recipientSection.title = @"RECIPIENT";
	[root addSection:self.recipientSection];
	NSArray* options = @[@"Offering", @"General", @"Capital"];
	self.recipient = [[QSegmentedElement alloc] initWithItems:options selected:UISegmentedControlNoSegment title:@"Title"];
	self.recipient.controllerAction = @"didSelectRecipient";
	[self.recipientSection addElement:self.recipient];
	
	// AMOUNT section
	NSArray* amountOptions = @[@"$1", @"$5", @"$10", @"$25", @"$50"];
	QSection *amountSection = [[QRadioSection alloc] initWithItems:amountOptions selected:0];
	amountSection.title = @"AMOUNT";
	[root addSection:amountSection];
	
	// DONATE section
	QSection *donateSection = [[QSection alloc] init];
	[root addSection:donateSection];
	QButtonElement* donateButton = [[QButtonElement alloc] initWithTitle:@"Donate"];
	[donateSection addElement:donateButton];
	donateButton.controllerAction = @"showDonateScreen";

	self.quickDialogTableView.sectionFooterHeight = 40.0;

	self.root = root;
	[self loadView];
}

- (void) didSelectRecipient
{
	NSString* message;
	
	switch (self.recipient.selected)
	{
		case 0:
			message = @"Your donation will go to Sunday's offering recipient: Svenson Justice Scholarship Fund.";
			break;
			
		case 1:
			message = @"Your donation will go to Unity's general fund.";
			break;

		case 2:
			message = @"Your donation will go to Unity's current capital campaign.";
			break;
	}
	
	self.recipientSection.footer = message;
	[self.quickDialogTableView reloadData];
}

- (void) showDonateScreen
{
	[self performSegueWithIdentifier:@"showDonatePage" sender:@"https://secure.acceptiva.com/?cst=1aadb6"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([[segue identifier] isEqualToString:@"showDonatePage"])
	{
		[[segue destinationViewController] setDetailItem:[NSURL URLWithString:sender]];
	}
}

@end
