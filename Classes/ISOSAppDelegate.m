//
//  ISOSAppDelegate.m
//  ISOS
//
//  Created by Atikur Rahman on 7/14/11.
//  Copyright 2011 Annanovas IT. All rights reserved.
//

#import "ISOSAppDelegate.h"

@implementation ISOSAppDelegate

#define fadeinDuration	0.5

@synthesize window;

@synthesize bvc;
@synthesize currentNavigation;
@synthesize alertNavigation, trouverNavigation, facebookNavigation, parametresNavigation;
@synthesize userDetailsInfo;
@synthesize currentMember;


-(void) removeBKImages {
	
	[imgViewLoading removeFromSuperview];
	[imgBeigieBK removeFromSuperview];
}

-(void) startApplication {
	
	bvc = [[BottomViewController alloc] init];
	bvc.view.frame = CGRectMake(10, 480-50, 300, 50);
	bvc.view.alpha = 0;
	[window addSubview:bvc.view];
	[bvc callAlertPage];
	alertNavigation.view.alpha = 0;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:fadeinDuration*1.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDelegate: self];
	
	imgViewLoading.alpha = 0;
	bvc.view.alpha = 1;
	alertNavigation.view.alpha = 1;
	
	[UIView commitAnimations];
	
	[NSTimer scheduledTimerWithTimeInterval:fadeinDuration*1.5 target:self selector:@selector(removeBKImages) userInfo:nil repeats:NO];
	
}


-(void) fadeinLogo{
	
	imgViewLoading.image = [UIImage imageNamed:@"loading_page_img.png"];
	imgViewLoading.alpha = 1;
	/*
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:fadeinDuration*3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDelegate: self];
	imgViewLoading.alpha = 1;
	[UIView commitAnimations];
	*/
	[NSTimer scheduledTimerWithTimeInterval:fadeinDuration*3 target:self selector:@selector(startApplication) userInfo:nil repeats:NO];

}


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	
	NSArray *pathsDocument = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *uniquePath = [NSString stringWithFormat:@"%@/%@", [pathsDocument objectAtIndex:0], @"Database.plist"];
	
	if(![[NSFileManager defaultManager] fileExistsAtPath: uniquePath])
	{
		NSString   *savePath = [@"~/Documents/Database.plist" stringByExpandingTildeInPath];
		NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Database" ofType:@"plist"];
		NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:dataPath];
		
		[data writeToFile: savePath atomically: YES];
		
		NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
		[prefs setObject:@"13" forKey:@"next_user_id"];
		
	}
	
	imgBeigieBK = [[UIImageView alloc] init];
	imgBeigieBK.image = [UIImage imageNamed:@"Default.png"];
	imgBeigieBK.frame = CGRectMake(0, 0, 320, 480);
	[window addSubview:imgBeigieBK];
    imgBeigieBK.alpha = 1;
	
	imgViewLoading= [[UIImageView alloc] init];
	imgViewLoading.frame = CGRectMake(0, 0, 320, 480);
	[window addSubview:imgViewLoading];
	
	[self fadeinLogo];
	
    [self.window makeKeyAndVisible];
    
    return YES;
	
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
