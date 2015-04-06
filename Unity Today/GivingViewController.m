//
//  GivingViewController.m
//  Unity Today
//
//  Created by Erik Jordan on 6/24/14.
//  Copyright (c) 2014 Erik Jordan. All rights reserved.
//

#import "GivingViewController.h"

@interface GivingViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *amountSegmentedControl;

@end

@implementation GivingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)didPressDonateButton:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)didChangeAmount:(id)sender
{
    [self.tableView reloadData];
    // [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        if (self.amountSegmentedControl.selectedSegmentIndex == 4)
        {
            return 2;
        }
        
        return 1;
    }
    
    return 1;
}

@end
