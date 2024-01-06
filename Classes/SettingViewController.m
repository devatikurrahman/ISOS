//
//  SettingViewController.m
//  ISOS
//
//  Created by Atikur Rahman on 7/14/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "SettingViewController.h"
#import "ISOSAppDelegate.h"

#import "ManageAlertViewController.h"
#import "ManageUserViewController.h"
#import "ContactUsViewController.h"


@implementation SettingViewController


-(IBAction) manageAlert {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *) [[UIApplication sharedApplication] delegate];
	ManageAlertViewController *mavc = [[ManageAlertViewController alloc] init];
	[appDelegate.parametresNavigation pushViewController:mavc animated:YES];
	
}

-(IBAction) manageUser {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *) [[UIApplication sharedApplication] delegate];
	ManageUserViewController *muvc = [[ManageUserViewController alloc] init];
	[appDelegate.parametresNavigation pushViewController:muvc animated:YES];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	viewName.text = @"Réglages";
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
