//
//  LuaBridge.m
//  LuaCocos2D
//
//  Created by Boris Cosic on 10-10-28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LuaBridge.h"

extern "C"{
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include "lstring.h"
};

int lua(const char *path) {
	
	lua_State *l;
	l = lua_open();
	luaopen_base(l);
	luaopen_string(l);	// load the string library
	luaL_openlibs(l);	// load all libraries
	
	int width = 0;
	int height = 0;
	
	printf("\nAbout to run Lua code\n");
	
	luaL_loadstring(l, "print(\"Running Lua Code...\")");
	
	lua_pcall(l, 0, LUA_MULTRET, 0);
	
	if(luaL_dofile(l, path)) {
		printf("%s",lua_tostring(l,-1));
	}
	else {
		lua_getglobal(l, "width");
		lua_getglobal(l, "height");
		
		width = (int)lua_tonumber(l, -2);
		height = (int)lua_tonumber(l, -1);
	}
	
	NSLog(@"width: %d, height: %d", width, height);
	
	lua_close(l);
	return 0;
}

@implementation LuaBridge

- (void) run_lua:(NSString *)path {
	NSLog(@"path = %@", path);
	lua([path UTF8String]);
}

@end
