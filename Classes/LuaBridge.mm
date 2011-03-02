//
//  LuaBridge.m
//  LuaCocos2D
//
//  Created by Boris Cosic on 10-10-28.
//

#import "LuaBridge.h"

int lua(const char *path, const char* modname, const luaL_Reg *modslib) {
	
	lua_State *l;		
	l = lua_open();						// initialize lua
	luaopen_base(l);					
	luaopen_string(l);					// load the string library
	luaL_openlibs(l);					// load all libraries
	luaL_register(l, modname, modslib);	// register external libraries
	
	if(luaL_dofile(l, path)) {
		printf("%s",lua_tostring(l,-1));
	}
	
	lua_close(l);
	return 0;
}

@implementation LuaBridge
@synthesize _lua_script;

- (void) prepare_lua:(NSString *)lua_script {
	// determine the home of the app
	NSString* home = NSHomeDirectory();
	NSMutableString* path = [[NSMutableString alloc] init];
	[path setString:home];
	[path appendString:lua_script];
	self._lua_script = path;
	NSLog(@"Lua script at %@", path);
	
	//lua([path UTF8String], self._node);
}


@end
