//
//  NotificationViewController.m
//  ISOS
//
//  Created by Atikur Rahman on 7/19/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "NotificationViewController.h"
#import "ISOSAppDelegate.h"
#import "ItemWrapper.h"
#import "LocationViewController.h"



@implementation NotificationViewController

@synthesize tmpCell, data;
@synthesize collation, notificationListArray;


NSInteger notificationSort(id num1, id num2, void *context) {
	
	ItemWrapper *date1 = num1;
	ItemWrapper *date2 = num2;
		
	if ([date1 getNotification] > [date2 getNotification]) {
		return NSOrderedAscending;
	}
	else {
		return NSOrderedDescending;
	}
	
	return NSOrderedSame;
}



-(void) getMemberList:(NSString *) member {
	
	self.collation = [UILocalizedIndexedCollation currentCollation];
	
	// Load the data.
	NSString   *dataPath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
    self.data = [NSDictionary dictionaryWithContentsOfFile:dataPath];
	
	NSArray *userList = [data objectForKey:@"NotificationList"];
	
	NSMutableArray *tmpUserListArray = [[NSMutableArray alloc] init];
	for (NSDictionary *dataItem in userList) {
		if ([[dataItem objectForKey:@"recognise_member"] isEqualToString:member]) {
			
			ItemWrapper *tmpItem = [[ItemWrapper alloc] initWithItem:dataItem];
			[tmpUserListArray addObject:tmpItem];
			[tmpItem release];
		}
	}
	
	NSArray *sortedItemListArray = [tmpUserListArray sortedArrayUsingFunction:notificationSort context:nil];
	self.notificationListArray = [NSMutableArray arrayWithArray:sortedItemListArray];

	
	[listtable reloadData];
	
}


-(IBAction) goBack {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate.alertNavigation popViewControllerAnimated:YES];
	
}


-(IBAction) showMedicalPersonList {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.currentMember = @"medical";
	
	if (medicalBtn.selected == YES) {
		return;
	}
	medicalBtn.selected = YES;
	securityBtn.selected = NO;
	familylBtn.selected = NO;
	
	[self getMemberList:appDelegate.currentMember];
	
}

-(IBAction) showSecurityPersonList {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.currentMember = @"security";
	
	if (securityBtn.selected == YES) {
		return;
	}
	medicalBtn.selected = NO;
	securityBtn.selected = YES;
	familylBtn.selected = NO;
	
	[self getMemberList:appDelegate.currentMember];
	
}

-(IBAction) showFamilyPersonList {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.currentMember = @"family";
	
	if (familylBtn.selected == YES) {
		return;
	}
	medicalBtn.selected = NO;
	securityBtn.selected = NO;
	familylBtn.selected = YES;
	
	[self getMemberList:appDelegate.currentMember];
	
}


-(void) viewWillAppear:(BOOL)animated {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	viewName.text = @"Besoin d'aide";
	
	listtable.rowHeight = 50;
    listtable.backgroundColor = [UIColor clearColor];
    listtable.separatorStyle = UITableViewCellSelectionStyleNone;
	
	if ([appDelegate.currentMember isEqualToString:@"medical"]) {
		[self showMedicalPersonList];
	}
	else if([appDelegate.currentMember isEqualToString:@"security"]){
		[self showSecurityPersonList];
	}
	else if([appDelegate.currentMember isEqualToString:@"family"]){
		[self showFamilyPersonList];
	}
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.currentMember = @"family";
	
}


#pragma mark Table view methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [notificationListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ApplicationCell";
    
    ApplicationCell *cell = (ApplicationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
		
		[[NSBundle mainBundle] loadNibNamed:@"IndividualSubviewsBasedApplicationCell2" owner:self options:nil];
        cell = tmpCell;
        self.tmpCell = nil;
		
    }
    
	ItemWrapper *dataItem = [notificationListArray objectAtIndex:indexPath.row];
	
	cell.name = [[dataItem item] objectForKey:@"name"];
	cell.address1 = [[dataItem item] objectForKey:@"street address"];
	
	NSString *address = [NSString stringWithFormat:@"%@ - %@, %@", [[dataItem item] objectForKey:@"city"], [[dataItem item] objectForKey:@"zip_code"], [[dataItem item] objectForKey:@"country"]];
	cell.address2 = address;
	
	cell.date = [[dataItem item] objectForKey:@"date"];
	cell.time = [[dataItem item] objectForKey:@"time"];
	
	
	UIView *v = [[[UIView alloc] init] autorelease];
	v.frame = cell.frame;
	CGRect frame = v.frame;
	frame.size.height = frame.size.height - 1;
	v.frame = frame;
	
	/*
	 v.backgroundColor = [UIColor colorWithRed:((float) 176 / 255.0f)
	 green:((float) 160/ 255.0f)
	 blue:((float) 126/ 255.0f)
	 alpha:0.3f];
	 */
	
	v.backgroundColor = [UIColor clearColor];
	cell.selectedBackgroundView = v;
	
	
    cell.accessoryType = UITableViewCellAccessoryNone;
	
    return cell;
	
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell.backgroundColor = [UIColor colorWithRed:197/255.0 green:182/255.0 blue:149/255.0 alpha:1.0];
	cell.backgroundColor = [UIColor clearColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
	
	ItemWrapper *tmpItem = [notificationListArray objectAtIndex:indexPath.row];
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	LocationViewController *lvc = [[LocationViewController alloc] init];
	[lvc setNotificationData:[tmpItem item]];
	[appDelegate.alertNavigation pushViewController:lvc animated:YES];
		
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		
		// Delete item from the given index
		ItemWrapper *selectedItem = [notificationListArray objectAtIndex:indexPath.row];
		
		NSString   *dataPath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
		NSDictionary *tmpdata = [NSDictionary dictionaryWithContentsOfFile:dataPath];
		NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:[tmpdata objectForKey:@"NotificationList"]];
		
		NSInteger index = 0;
		for (NSDictionary *dataItem in tmpArray) {
			if ([[dataItem objectForKey:@"notification_id"] isEqualToString:[[selectedItem item] objectForKey:@"notification_id"]]) {
				
				[tmpArray removeObjectAtIndex:index];
				
				[tmpdata setValue:tmpArray forKey:@"NotificationList"];
				NSString   *savePath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
				[tmpdata writeToFile: savePath atomically: YES];
				
				break;
			}
			index++;
		}
		
		
		ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
		[self getMemberList:appDelegate.currentMember];
		
	}		
	
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
