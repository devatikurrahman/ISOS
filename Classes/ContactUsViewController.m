//
//  ContactUsViewController.m
//  ISOS
//
//  Created by Atikur Rahman on 7/14/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "ContactUsViewController.h"


@implementation ContactUsViewController



-(void) resetKeyBoard {
	
	[name_txt resignFirstResponder];
	[email_txt resignFirstResponder];
	[phone_txt resignFirstResponder];
	[message_txt resignFirstResponder];
	
	CGRect frame = contactView.frame;
	
	if (frame.origin.y != 46){
		frame.origin.y = 46;
		
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		contactView.frame = CGRectMake(0, 46, 320, 380);
		
		[UIView commitAnimations];
	}
	
}

-(IBAction) sendMessage {
	
	[self resetKeyBoard];
	
	NSLog(@"send message");
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	viewName.text = @"Contactez";
	
}


#pragma mark -
#pragma mark - UITouch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[self resetKeyBoard];
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	

	if ([textField isEqual:email_txt]) {
	
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		contactView.frame = CGRectMake(0, -20, 320, 380);
		
		[UIView commitAnimations];
	}
	else if ([textField isEqual:phone_txt]) {
		
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		contactView.frame = CGRectMake(0, -60, 320, 380);
		
		[UIView commitAnimations];
	}
	else if ([textField isEqual:message_txt]) {
		
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		contactView.frame = CGRectMake(0, -100, 320, 380);
		
		[UIView commitAnimations];
	}
	
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[name_txt resignFirstResponder];
	
	if ([textField isEqual:name_txt]) {
		[email_txt becomeFirstResponder];
		
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		contactView.frame = CGRectMake(0, -20, 320, 380);
		
		[UIView commitAnimations];
	}
	else if ([textField isEqual:email_txt]) {
		[phone_txt becomeFirstResponder];
		
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		contactView.frame = CGRectMake(0, -60, 320, 380);
		
		[UIView commitAnimations];
	}
	else if ([textField isEqual:phone_txt]) {
		[message_txt becomeFirstResponder];
		
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		contactView.frame = CGRectMake(0, -100, 320, 380);
		
		[UIView commitAnimations];
	}
	else if ([textField isEqual:message_txt]) {
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
