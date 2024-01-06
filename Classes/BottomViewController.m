//
//  BottomViewController.m
//  ISOS
//
//  Created by Atikur Rahman on 7/14/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "BottomViewController.h"
#import "ISOSAppDelegate.h"
#import "AlertViewController.h"
#import "LocationViewController.h"
#import "FacebookViewController.h"
#import "SettingViewController.h"
#import "ContactUsViewController.h"



@implementation BottomViewController



-(IBAction) callAlertPage {
	
	if (alertBtn.selected == YES) {
		return;
	}

	alertBtn.selected = YES;
	trouverBtn.selected = NO;
	facebookBtn.selected = NO;
	parametresBtn.selected = NO;
	
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if (appDelegate.alertNavigation == nil) {
		
		AlertViewController *avc = [[AlertViewController alloc] init];
		
		appDelegate.alertNavigation = [[UINavigationController alloc] init];
		appDelegate.alertNavigation.view.frame = CGRectMake(0, 0, 320, 480);
		appDelegate.alertNavigation.navigationBarHidden = YES;
		[appDelegate.alertNavigation initWithRootViewController: avc];
		[appDelegate.window addSubview:appDelegate.alertNavigation.view];
		appDelegate.alertNavigation.view.alpha = 1;
		
	}
	else {
		
		[appDelegate.window bringSubviewToFront:appDelegate.alertNavigation.view];
	}
	
	[appDelegate.window bringSubviewToFront:appDelegate.bvc.view];
	appDelegate.currentNavigation = appDelegate.alertNavigation;
}


-(IBAction) callFacebookPage {
	
	if (facebookBtn.selected == YES) {
		return;
	}
	
	
	alertBtn.selected = NO;
	trouverBtn.selected = NO;
	facebookBtn.selected = YES;
	parametresBtn.selected = NO;
	
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if (appDelegate.facebookNavigation == nil) {
		
		FacebookViewController *fvc = [[FacebookViewController alloc] init];
		
		appDelegate.facebookNavigation = [[UINavigationController alloc] init];
		appDelegate.facebookNavigation.view.frame = CGRectMake(0, 0, 320, 480);
		appDelegate.facebookNavigation.navigationBarHidden = YES;
		[appDelegate.facebookNavigation initWithRootViewController: fvc];
		[appDelegate.window addSubview:appDelegate.facebookNavigation.view];
		appDelegate.facebookNavigation.view.alpha = 1;
		
	}
	else {
		
		[appDelegate.window bringSubviewToFront:appDelegate.facebookNavigation.view];
	}
	
	[appDelegate.window bringSubviewToFront:appDelegate.bvc.view];
	appDelegate.currentNavigation = appDelegate.facebookNavigation;
}


-(IBAction) callParametresPage {
	
	if (parametresBtn.selected == YES) {
		return;
	}

	
	alertBtn.selected = NO;
	trouverBtn.selected = NO;
	facebookBtn.selected = NO;
	parametresBtn.selected = YES;
	
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if (appDelegate.parametresNavigation == nil) {
		
		SettingViewController *svc = [[SettingViewController alloc] init];
		
		appDelegate.parametresNavigation = [[UINavigationController alloc] init];
		appDelegate.parametresNavigation.view.frame = CGRectMake(0, 0, 320, 480);
		appDelegate.parametresNavigation.navigationBarHidden = YES;
		[appDelegate.parametresNavigation initWithRootViewController: svc];
		[appDelegate.window addSubview:appDelegate.parametresNavigation.view];
		appDelegate.parametresNavigation.view.alpha = 1;
		
	}
	else {
		
		[appDelegate.window bringSubviewToFront:appDelegate.parametresNavigation.view];
	}
	
	[appDelegate.window bringSubviewToFront:appDelegate.bvc.view];
	appDelegate.currentNavigation = appDelegate.parametresNavigation;
	
}


-(IBAction) callContactPage {
	
	if (trouverBtn.selected == YES) {
		return;
	}
	
	
	alertBtn.selected = NO;
	trouverBtn.selected = YES;
	facebookBtn.selected = NO;
	parametresBtn.selected = NO;
	
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if (appDelegate.trouverNavigation == nil) {
		
		ContactUsViewController *cvc = [[ContactUsViewController alloc] init];
		
		appDelegate.trouverNavigation = [[UINavigationController alloc] init];
		appDelegate.trouverNavigation.view.frame = CGRectMake(0, 0, 320, 480);
		appDelegate.trouverNavigation.navigationBarHidden = YES;
		[appDelegate.trouverNavigation initWithRootViewController: cvc];
		[appDelegate.window addSubview:appDelegate.trouverNavigation.view];
		appDelegate.trouverNavigation.view.alpha = 1;
		
	}
	else {
		
		[appDelegate.window bringSubviewToFront:appDelegate.trouverNavigation.view];
	}
	
	[appDelegate.window bringSubviewToFront:appDelegate.bvc.view];
	appDelegate.currentNavigation = appDelegate.trouverNavigation;
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
