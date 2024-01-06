//
//  IndividualSubviewsBasedApplicationCell2.m
//  Fortuny Fabric Browser 2
//
//  Created by Roni on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "IndividualSubviewsBasedApplicationCell.h"


@implementation IndividualSubviewsBasedApplicationCell



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




- (void)setImage:(UIImage *)newImage
{
    [super setImage:newImage];
    titleimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",  newImage]];
}

- (void)setEmail:(NSString *)newEmail{
    [super setEmail:newEmail];
    emailLabel.text = newEmail;
	UIFont* custom_font = [UIFont fontWithName: @"ArialMT" size:9.0];
	emailLabel.font = custom_font;
	
}

- (void)setPhonenum:(NSString *)newPhoneNum {
    [super setPhonenum:newPhoneNum];
    phonenumLabel.text = newPhoneNum;
	UIFont* custom_font = [UIFont fontWithName: @"ArialMT" size:9.0];
	phonenumLabel.font = custom_font;
	
}


- (void)setName:(NSString *)newTitle{
    [super setName:newTitle];
    nameLabel.text = newTitle;
	UIFont* custom_font = [UIFont fontWithName: @"Arial-BoldMT" size:11.0];
	nameLabel.font = custom_font;
	
	//[self setUILabel:titlelabel withMaxFrame:titlelabel.frame withText:newTitle usingVerticalAlign:1];
}

- (void)dealloc
{
	
    [titleimage release];
    [phonenumLabel release];
    [nameLabel release];
	[emailLabel release];
	
    [super dealloc];
}

@end
