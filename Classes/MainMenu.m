//
//  MainMenu.m
//  LuaCocos2D
//
//  Created by Boris Cosic on 10-10-27.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

// Import the interfaces
#import "MainMenu.h"
#import "LuaMenu.h"

// MainMenu implementation
@implementation MainMenu

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	// add layer as a child to scene
	MainMenu *menu = [MainMenu node];
	[scene addChild: menu];
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		LuaMenu *lua_menu = [[LuaMenu alloc] initWithScript:@"/LuaCocos2D.app/LuaMenu.lua" node:self];
		[lua_menu release];
	}
	return self;
}

-(void) onStartGame: (id) sender
{
	NSLog(@"Start Game");
}

-(void) onHelp: (id)sender {
	NSLog(@"Help");
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
