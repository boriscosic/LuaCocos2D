//
//  LuaBridge.h
//  LuaCocos2D
//
//  Created by Boris Cosic on 10-10-28.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

extern "C" {
	#include "lua.h"
	#include "lualib.h"
	#include "lauxlib.h"	
	#include "lstring.h"
};

// define common constant for the engine. 
static const CCNode *ccnode;
static const CCNode *ccmenu;
int lua(const char *, const char *, const luaL_Reg *);

@interface LuaBridge : NSObject {
	NSString *_lua_script;
}

@property(nonatomic,retain) NSString *_lua_script;

- (void)prepare_lua: (NSString *)lua_script;

@end

