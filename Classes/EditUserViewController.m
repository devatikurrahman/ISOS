//
//  EditUserViewController.m
//  ISOS
//
//  Created by Atikur Rahman on 7/15/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "EditUserViewController.h"
#import "ISOSAppDelegate.h"
#import "ManageUserViewController.h"


@implementation EditUserViewController

@synthesize editDetailsDict;


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


-(IBAction) saveUserDetails {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	NSString   *dataPath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:dataPath];
	
	NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:[data objectForKey:@"UserList"]];
	
	NSString *user_id = @"";
	user_id = [editDetailsDict objectForKey:@"user_id"];
	
	int update_index = 0;
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
	
	if ([user_id length] >= 0) {
		for(NSDictionary *item in tmpArray){
			if ([[item objectForKey:@"user_id"] isEqualToString:user_id]) {
				break;
			}
			update_index++;
		}
	}	
	
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
							  [editDetailsDict objectForKey:@"address"],
							  person_active,
							  recognise_member,
							  nil];
	
	
	NSMutableDictionary *updateComponent = [NSMutableDictionary dictionaryWithObjects:values forKeys:key];
	
	[tmpArray replaceObjectAtIndex:update_index withObject:updateComponent];
	[appDelegate setUserDetailsInfo:updateComponent];
	
	[data setValue:tmpArray forKey:@"UserList"];
	NSString   *savePath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
	[data writeToFile: savePath atomically: YES];

	
	[self resetKeyBoard];
	[appDelegate.parametresNavigation popViewControllerAnimated:YES];
	//[appDelegate.parametresNavigation popToRootViewControllerAnimated:YES];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	viewName.text = @"Modifier un utilisateur";
	
	name_txt.text = [editDetailsDict objectForKey:@"name"];
	email_txt.text = [editDetailsDict objectForKey:@"email"];
	phone_txt.text = [editDetailsDict objectForKey:@"phone_num"];
	
	person_active = [editDetailsDict objectForKey:@"active"];
	if ([[editDetailsDict objectForKey:@"active"] isEqualToString:@"1"]) {
		activeBtn.selected = YES;
		inActiveBtn.selected = NO;
	}
	else {
		activeBtn.selected = NO;
		inActiveBtn.selected = YES;
	}
	
	recognise_member = [editDetailsDict objectForKey:@"recognise_member"];
	if ([[editDetailsDict objectForKey:@"recognise_member"] isEqualToString:@"medical"]) {
		medicalBtn.selected = YES;
		securityBtn.selected = NO;
		familyBtn.selected = NO;
	}
	if ([[editDetailsDict objectForKey:@"recognise_member"] isEqualToString:@"security"]) {
		medicalBtn.selected = NO;
		securityBtn.selected = YES;
		familyBtn.selected = NO;
	}
	if ([[editDetailsDict objectForKey:@"recognise_member"] isEqualToString:@"family"]) {
		medicalBtn.selected = NO;
		securityBtn.selected = NO;
		familyBtn.selected = YES;
	}
	
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
