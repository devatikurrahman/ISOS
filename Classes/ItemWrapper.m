//
//  ItemWrapper.m
//  Fortuny Fabric Browser 2
//
//  Created by Roni on 3/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ItemWrapper.h"


@implementation ItemWrapper

@synthesize title;
@synthesize item;

- (id)initWithItem:(NSDictionary *)data {
	
	if (self = [super init]) {
		item = data;
		title = [item objectForKey:@"title"];
	}
	
	return self;
	
}

- (NSString *) getName{
	return [item objectForKey:@"name"];
}


- (NSString *) titleName{
	return title;//[dataItem objectForKey:@"Publisher"];
}


- (int) getNotification {
	return [[item objectForKey:@"notification_id"] intValue];
}

- (void)dealloc {
	
	//[title release];
	[super dealloc];
}


@end
