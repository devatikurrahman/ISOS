//
//  IndividualSubviewsBasedApplicationCell2.m
//  Fortuny Fabric Browser 2
//
//  Created by Roni on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "IndividualSubviewsBasedApplicationCell2.h"

@implementation IndividualSubviewsBasedApplicationCell2



- (void)setUILabel:(UILabel *)myLabel withMaxFrame:(CGRect)maxFrame withText:(NSString *)theText usingVerticalAlign:(int)vertAlign {
	CGSize stringSize = [theText sizeWithFont:myLabel.font constrainedToSize:maxFrame.size lineBreakMode:myLabel.lineBreakMode];
	
	switch (vertAlign) {
		case 0: // vertical align = top
			myLabel.frame = CGRectMake(myLabel.frame.origin.x, 
									   myLabel.frame.origin.y, 
									   myLabel.frame.size.width, 
									   stringSize.height
									   );
			break;
			
		case 1: // vertical align = middle
			// don't do anything, lines will be placed in vertical middle by default
			break;
			
		case 2: // vertical align = bottom
			myLabel.frame = CGRectMake(myLabel.frame.origin.x, 
									   (myLabel.frame.origin.y + myLabel.frame.size.height) - stringSize.height, 
									   myLabel.frame.size.width, 
									   stringSize.height
									   );
			break;
	}
	
	myLabel.text = theText;
}


- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
	
    nameLabel.backgroundColor = backgroundColor;
	address1Label.backgroundColor = backgroundColor;
	address2Label.backgroundColor = backgroundColor;
    //ratingView.backgroundColor = backgroundColor;
    
}

- (void)setName:(NSString *)newTitle{
    [super setName:newTitle];
    nameLabel.text = newTitle;
	UIFont* custom_font = [UIFont fontWithName: @"Arial-BoldMT" size:11.0];
	nameLabel.font = custom_font;
	
	//[self setUILabel:titlelabel withMaxFrame:titlelabel.frame withText:newTitle usingVerticalAlign:1];
}

- (void)setAddress1:(NSString *)newAddress1{
    [super setAddress1:newAddress1];
    address1Label.text = newAddress1;
	UIFont* custom_font = [UIFont fontWithName: @"ArialMT" size: 9.0];
	address1Label.font = custom_font;
	
}

- (void)setAddress2:(NSString *)newAddress2{
    [super setAddress2:newAddress2];
    address2Label.text = newAddress2;
	UIFont* custom_font = [UIFont fontWithName: @"ArialMT" size: 9.0];
	address2Label.font = custom_font;
	
}

- (void)setDate:(NSString *)newDate{
    [super setDate:newDate];
    dateLabel.text = newDate;
	UIFont* custom_font = [UIFont fontWithName: @"ArialMT" size: 9.0];
	dateLabel.font = custom_font;
	
}

- (void)setTime:(NSString *)newTime{
    [super setTime:newTime];
    timeLabel.text = newTime;
	UIFont* custom_font = [UIFont fontWithName: @"ArialMT" size: 9.0];
	timeLabel.font = custom_font;
	
}



- (void)dealloc
{
    [nameLabel release];
	[address1Label release];
	[address2Label release];
	
    [super dealloc];
}

@end
