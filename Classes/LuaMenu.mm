//
//  LuaMenu.m
//  LuaCocos2D
//
//  Created by Boris Cosic on 2/03/11.
//

#import "LuaMenu.h"
#import "LuaBridge.h"

static int new_menu(lua_State *l) {
	return 1;
}

static int add_menu(lua_State *l) {	
	// get number of arguments
	int n = lua_gettop(l);
	if(n != 5) luaL_error(l, "Lua error: invalid number of arguments");
	
	const char *title = luaL_checkstring(l, 2);
	const char *select = luaL_checkstring(l, 3);
	int xpos = luaL_checkinteger(l, 4);
	int ypos = luaL_checkinteger(l, 5);
	
	NSString *selector = [NSString stringWithFormat:@"%@:", [NSString stringWithUTF8String:select]];
	CCMenuItemFont *item = [CCMenuItemFont itemFromString:[NSString stringWithUTF8String:title] target:ccnode 
												 selector:NSSelectorFromString(selector)];
	[item setPosition:ccp(xpos, ypos)];
	[ccmenu addChild:item];
	return 1;
}

static int render_menu(lua_State *l) {
	NSLog(@"render menu");
	[ccnode addChild:ccmenu];	
	return 1;
}

static const luaL_Reg menu_funcs[] = {
	{"new", new_menu},
	{"add", add_menu},
	{"render", render_menu},
	{NULL, NULL}
};

@implementation LuaMenu

@synthesize _lua_script;
@synthesize _node;
@synthesize _menu;

-(id) initWithScript:(NSString *)lua_script node:(CCNode *)node  {
	if((self = [super init])) {
		self._lua_script = lua_script;
		self._node = node;
		
		ccmenu = [CCMenu menuWithItems:nil];
		ccnode = self._node;
		
		LuaBridge *lua_bridge = [[LuaBridge alloc] init];
		[lua_bridge prepare_lua:lua_script];
		lua([lua_bridge._lua_script UTF8String], "Menu", menu_funcs);
	}
	return self;
}

@end