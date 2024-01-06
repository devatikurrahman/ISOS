//
//  AddNewUser.m
//  ISOS
//
//  Created by Atikur Rahman on 7/16/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "AddNewUser.h"
#import "ISOSAppDelegate.h"


@implementation AddNewUser


-(void) resetKeyBoard {
	
	[name_txt resignFirstResponder];
	[email_txt resignFirstResponder];
	[phone_txt resignFirstResponder];
	
	CGRect frame = bkImg.frame;
	
	if (frame.origin.y != 0){
		frame.origin.y = 0;
		
		[UIView beginAnimations: nil context:nil];
		[UIView setAnimationDuration:.5];
		
		bkImg.frame = CGRectMake(0, 0, 320, 480);
		
		[UIView commitAnimations];
	}
	
}

-(IBAction) goBack {
	
	[self resetKeyBoard];
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate.parametresNavigation popViewControllerAnimated:YES];
}

-(IBAction) selectActive {
	
	activeBtn.selected = YES;
	inActiveBtn.selected = NO;
	
	person_active = @"1";
	
}

-(IBAction) selectInActive {
	
	activeBtn.selected = NO;
	inActiveBtn.selected = YES;
	
	person_active = @"0";
	
}

-(IBAction) selectMedical {
	
	medicalBtn.selected = YES;
	securityBtn.selected = NO;
	familyBtn.selected = NO;
	
	recognise_member = @"medical";
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.currentMember = @"medical";
	
}

-(IBAction) selectSecurity {
	
	medicalBtn.selected = NO;
	securityBtn.selected = YES;
	familyBtn.selected = NO;
	
	recognise_member = @"security";
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.currentMember = @"security";
	
}

-(IBAction) selectFamily {
	
	medicalBtn.selected = NO;
	securityBtn.selected = NO;
	familyBtn.selected = YES;
	
	recognise_member = @"family";
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.currentMember = @"family";
	
}


-(IBAction) saveNewUserInfo {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	NSString   *dataPath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:dataPath];
	
	NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:[data objectForKey:@"UserList"]];
	
	NSString *user_id = @"";
	
	int alart_flag = 0;
	
	if ([name_txt.text length] == 0) {
		alart_flag = 1;
	}
	if ([email_txt.text length] == 0) {
		alart_flag = 1;
	}
	if ([phone_txt.text length] == 0) {
		alart_flag = 1;
	}
	
	if (alart_flag == 1) {
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Name, Email, Phone Number are required!!" 
													   delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil, nil ];
		[alert show];	
		[alert release];
		
		return;
	}
	
	
	user_id = [prefs objectForKey:@"next_user_id"];		
	
	NSMutableArray *key = [NSMutableArray arrayWithObjects:
						   @"user_id",
						   @"name",
						   @"phone_num", 
						   @"email", 
						   @"address", 
						   @"active", 
						   @"recognise_member",
						   nil];
	
	NSMutableArray *values = [NSMutableArray arrayWithObjects:
							  user_id,
							  name_txt.text,
							  phone_txt.text, 
							  email_txt.text, 
							  @"address_new",
							  person_active,
							  recognise_member,
							  nil];
	
	NSMutableDictionary *updateComponent = [NSMutableDictionary dictionaryWithObjects:values forKeys:key];
	[tmpArray addObject:updateComponent];
	
	[data setValue:tmpArray forKey:@"UserList"];
	NSString   *savePath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
	[data writeToFile: savePath atomically: YES];

	
	NSString *next_item_id  = [NSString stringWithFormat:@"%d", [user_id intValue]+1];
	[prefs setObject:next_item_id forKey:@"next_user_id"];
	
	NSLog(@"next user id: %@", [prefs objectForKey:@"next_user_id"]);
	
	[self resetKeyBoard];
	[appDelegate.parametresNavigation popViewControllerAnimated:YES];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	viewName.text = @"Ajouter utilisateur";
	
	person_active = @"";
	recognise_member = @"";
	
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
	
	[name_txt resignFirstResponder];
	
	if ([textField isEqual:name_txt]) {
		[email_txt becomeFirstResponder];
	}
	else if ([textField isEqual:email_txt]) {
		[phone_txt becomeFirstResponder];
	}
	else if ([textField isEqual:phone_txt]) {
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
