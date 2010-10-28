//
//  main.m
//  LuaCocos2D
//
//  Created by Boris Cosic on 10-10-27.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	int retVal = UIApplicationMain(argc, argv, nil, @"LuaCocos2DAppDelegate");
	[pool release];
	return retVal;
}
