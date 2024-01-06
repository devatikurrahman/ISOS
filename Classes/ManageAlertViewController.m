//
//  ManageAlertViewController.m
//  ISOS
//
//  Created by Atikur Rahman on 7/14/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "ManageAlertViewController.h"
#import "ISOSAppDelegate.h"


@implementation ManageAlertViewController


-(void) resetKeyBoard {
	
	[medical_txt resignFirstResponder];
	[security_txt resignFirstResponder];
	[famille_txt resignFirstResponder];
	
	CGRect frame = self.view.frame;
	
	if (frame.origin.y != 0){
		frame.origin.y = 0;
		
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		self.view.frame = CGRectMake(0, 0, 320, 480);
		
		[UIView commitAnimations];
	}
	
}


-(IBAction) goBack {
	
	[self resetKeyBoard];
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate.parametresNavigation popViewControllerAnimated:YES];
	
}

-(IBAction) savePhoneNumber {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	NSString   *dataPath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:dataPath];
	
	NSMutableArray *key = [NSMutableArray arrayWithObjects:
						   @"medical",
						   @"security",
						   @"famille",
						   nil];
	
	NSMutableArray *values = [NSMutableArray arrayWithObjects:
							  medical_txt.text,
							  security_txt.text,
							  famille_txt.text,
							  nil];

	NSMutableDictionary *updateComponent = [NSMutableDictionary dictionaryWithObjects:values forKeys:key];
	
	[data setValue:updateComponent forKey:@"AlertPhoneNumber"];
	NSString   *savePath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
	[data writeToFile: savePath atomically: YES];
	
	
	[self resetKeyBoard];
	[appDelegate.parametresNavigation popViewControllerAnimated:YES];
	
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	viewName.text = @"Manège d'alerte";
	
	NSString   *dataPath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
    NSDictionary *phoneNumberData = [[NSDictionary dictionaryWithContentsOfFile:dataPath] objectForKey:@"AlertPhoneNumber"];
	
	medical_txt.text = [phoneNumberData objectForKey:@"medical"];
	security_txt.text = [phoneNumberData objectForKey:@"security"];
	famille_txt.text = [phoneNumberData objectForKey:@"famille"];

	
}

#pragma mark -
#pragma mark - UITouch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[self resetKeyBoard];
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[medical_txt resignFirstResponder];
	
	if ([textField isEqual:medical_txt]) {
		[security_txt becomeFirstResponder];
	}
	else if ([textField isEqual:security_txt]) {
		[famille_txt becomeFirstResponder];
	}
	else if ([textField isEqual:famille_txt]) {
		[self resetKeyBoard];
	}
	
	return YES;
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
