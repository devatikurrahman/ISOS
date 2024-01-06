//
//  HomeViewController.m
//  ISOS
//
//  Created by Atikur Rahman on 7/14/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "AlertViewController.h"
#import "NotificationViewController.h"
#import "ISOSAppDelegate.h"

#define CallMakeTime 10

@implementation AlertViewController

@synthesize data;


-(void) resetTimer {
	
	secondCount = 0;
	currentTime = 0;
	previousTime = 0;
	
	if (timer != nil) {
		[timer invalidate];
		timer = nil;
	}
	
}

-(void) callOnNumbe:(NSString *) number {
	NSLog(@"call: %@", number);
	NSString *cellnum = [NSString stringWithFormat:@"tel://%@", number];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: cellnum]];//telephone
	
}

-(void) timeCountOnPress {
	
	secondCount++;
	if (secondCount == CallMakeTime) {
		timer_flag = 1;
		[timer invalidate];
		timer = nil;
		
		//NSLog(@"from timer");
		[self callOnNumbe:[data objectForKey:currentButtonName]];
		
		return;
	}
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeCountOnPress) userInfo:nil repeats:NO];
	
}



-(void) getTimeOnButtonPress {
	
	NSDate *now = [NSDate date];
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"hh:mm:ss:a";
	[dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
	NSString *getTime = [dateFormatter stringFromDate:now];
	NSArray  *currentTimeArray = [getTime componentsSeparatedByString:@":"];
	
	int hour = [[currentTimeArray objectAtIndex:0] intValue];
	int minute = [[currentTimeArray objectAtIndex:1] intValue];
	int second = [[currentTimeArray objectAtIndex:2] intValue];
		
	//if ([[currentTimeArray objectAtIndex:3] isEqualToString:@"PM"]) {
	//	hour += 12;
	//}
	
	previousTime = hour*3600 + minute*60 + second;
	
	[dateFormatter release];
	
	//[self timeCountOnPress];
	
}


-(void) getTimeOnButtonRelease {
	
	NSDate *now = [NSDate date];
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"hh:mm:ss:a";
	[dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
	NSString *getTime = [dateFormatter stringFromDate:now];
	NSArray  *currentTimeArray = [getTime componentsSeparatedByString:@":"];
	
	int hour = [[currentTimeArray objectAtIndex:0] intValue];
	int minute = [[currentTimeArray objectAtIndex:1] intValue];
	int second = [[currentTimeArray objectAtIndex:2] intValue];
	
	//if ([[currentTimeArray objectAtIndex:3] isEqualToString:@"PM"]) {
	//	hour += 12;
	//}
	
	currentTime = hour*3600 + minute*60 + second;

	[dateFormatter release];
	
}


-(NSInteger) timeDifference {
	NSLog(@"press time: %ds", currentTime-previousTime);
	return (currentTime-previousTime);
	
}



-(IBAction) callMedical {
	
	currentButtonName = @"medical";
	[self getTimeOnButtonPress];
	
}
-(IBAction) releaseMedicalFun {
	
	[self getTimeOnButtonRelease];
	int time_difference = [self timeDifference];
	[self resetTimer];
	
	if(time_difference >= CallMakeTime) {
		if (timer_flag == 1) {
			timer_flag = 0;
			return;
		}
		[self callOnNumbe:[data objectForKey:currentButtonName]];
	}
	else {
		NSLog(@"send notification");
	}
	
}



-(IBAction) callSecurity {
	
	currentButtonName = @"security";
	[self getTimeOnButtonPress];
	
}
-(IBAction) releaseSecurityFun {
	
	[self getTimeOnButtonRelease];
	int time_difference = [self timeDifference];
	[self resetTimer];
	
	if(time_difference >= CallMakeTime) {
		if (timer_flag == 1) {
			timer_flag = 0;
			return;
		}
		[self callOnNumbe:[data objectForKey:currentButtonName]];
	}
	else {
		NSLog(@"send notification");
	}
	
}
								


-(IBAction) callFamily {
	
	currentButtonName = @"famille";
	[self getTimeOnButtonPress];
	
}
-(IBAction) releaseFamilyFun {
	
	[self getTimeOnButtonRelease];
	int time_difference = [self timeDifference];
	[self resetTimer];
	
	if(time_difference >= CallMakeTime) {
		if (timer_flag == 1) {
			timer_flag = 0;
			return;
		}
		[self callOnNumbe:[data objectForKey:currentButtonName]];
	}
	else {
		
		NSLog(@"send notification");
	}
}



-(IBAction) getNotification {
	
	ISOSAppDelegate *appDelegate = (ISOSAppDelegate *)[[UIApplication sharedApplication] delegate];
	NotificationViewController *nvc = [[NotificationViewController alloc] init];
	[appDelegate.alertNavigation pushViewController:nvc animated:YES];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	timer_flag = 0;
	
	NSString   *dataPath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
    self.data = [[NSDictionary dictionaryWithContentsOfFile:dataPath] objectForKey:@"AlertPhoneNumber"];
	
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
