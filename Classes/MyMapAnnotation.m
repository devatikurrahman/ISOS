//
//  MyAnnotation.m
//  CEC
//
//  Created by roni alam on 8/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyMapAnnotation.h"


@implementation MyMapAnnotation

@synthesize latitude;
@synthesize longitude;
@synthesize data;


-(void)setAnnotationData:(NSDictionary *) annotationData {
	self.data = annotationData;
}

- (CLLocationCoordinate2D)coordinate {
	
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [[data objectForKey:@"latitude"] doubleValue];//37.786996;
    theCoordinate.longitude = [[data objectForKey:@"longitude"] doubleValue];
	
	//NSLog(@"data: %@", data);
	//NSLog(@"coordinate from plist: %f %f", theCoordinate.latitude, theCoordinate.longitude);
	
    return theCoordinate; 
}

- (NSString *) title
{
	//NSLog(@"name: %@", [data objectForKey:@"name"]);
	return [data objectForKey:@"name"];
}



- (void)dealloc
{
    [super dealloc];
}


@end
