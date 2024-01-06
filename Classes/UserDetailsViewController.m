//
//  UserDetailsViewController.m
//  ISOS
//
//  Created by Atikur Rahman on 7/15/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//


#import "UserDetailsViewController.h"
#import "ISOSAppDelegate.h"
#import "EditUserViewController.h"


@implementation UserDetailsViewController


-(IBAction) goBack {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate.parametresNavigation popViewControllerAnimated:YES];
	
}

-(IBAction) editUser {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	EditUserViewController *euvc = [[EditUserViewController alloc] init];
	[euvc setEditDetailsDict: appDelegate.userDetailsInfo];
	[appDelegate.parametresNavigation pushViewController:euvc animated:YES];

}


-(void) fillUserInformation {
	
	viewName.text = @"Détails de l'utilisateur";
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	nameLabel.text = [appDelegate.userDetailsInfo objectForKey:@"name"];
	emailLabel.text = [appDelegate.userDetailsInfo objectForKey:@"email"];
	phoneLabel.text = [appDelegate.userDetailsInfo objectForKey:@"phone_num"];
	
	if ([[appDelegate.userDetailsInfo objectForKey:@"active"] isEqualToString:@"1"]) {
		activeImg.image = [UIImage imageNamed:@"btn_active.png"];
		inActiveImg.image = [UIImage imageNamed:@"btn_inactive.png"];
	}
	else {
		activeImg.image = [UIImage imageNamed:@"btn_inactive.png"];
		inActiveImg.image = [UIImage imageNamed:@"btn_active.png"];
	}
	
	
	if ([[appDelegate.userDetailsInfo objectForKey:@"recognise_member"] isEqualToString:@"medical"]) {
		medicalImg.image = [UIImage imageNamed:@"btn_active.png"];
	}
	else {
		medicalImg.image = [UIImage imageNamed:@"btn_inactive.png"];
	}
	
	if ([[appDelegate.userDetailsInfo objectForKey:@"recognise_member"] isEqualToString:@"security"]) {
		securityImg.image = [UIImage imageNamed:@"btn_active.png"];
	}
	else {
		securityImg.image = [UIImage imageNamed:@"btn_inactive.png"];
	}
	
	if ([[appDelegate.userDetailsInfo objectForKey:@"recognise_member"] isEqualToString:@"family"]) {
		familyImg.image = [UIImage imageNamed:@"btn_active.png"];
	}
	else {
		familyImg.image = [UIImage imageNamed:@"btn_inactive.png"];
	}
	
}


-(void) viewWillAppear:(BOOL)animated {
	
	[self fillUserInformation];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
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
