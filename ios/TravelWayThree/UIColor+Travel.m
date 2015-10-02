//
//  UIColor+Travel.m
//  TravelWayThree
//
//  Created by Gustaf Nilklint on 2015-10-02.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

#import "UIColor+Travel.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation UIColor (Travel)

+ (UIColor*)TravelGreen;
{
  return UIColorFromRGB(0x588f27);
}
+ (UIColor*)TravelGreenLight;
{
  return UIColorFromRGB(0xa9cf54);
}

+ (UIColor*)TravelBlue;
{
  return UIColorFromRGB(0x2980b9);
}
+ (UIColor*)TravelBlueLight;
{
  return UIColorFromRGB(0x3399cc);
}

+ (UIColor*)TravelRed;
{
  return UIColorFromRGB(0xe74c3c);
}
+ (UIColor*)TravelRedLight;
{
  return UIColorFromRGB(0xff6666);
}

+ (UIColor*)TravelBlack;
{
  return UIColorFromRGB(0x333333);
}

+ (UIColor*)Travelwhite;
{
  return UIColorFromRGB(0xecf0f1);
}

@end
