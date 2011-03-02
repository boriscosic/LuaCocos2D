//
//  LuaMenu.h
//  LuaCocos2D
//
//  Created by Boris Cosic on 2/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LuaMenu : NSObject {
	NSString *_lua_script;
	CCNode *_node;
	CCMenu *_menu;
}

@property (nonatomic, retain) NSString *_lua_script;
@property (nonatomic, retain) CCNode *_node;
@property (nonatomic, retain) CCMenu *_menu;

- (id)initWithScript:(NSString *)lua_script node:(CCNode *)node;

@end
