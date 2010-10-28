//
//  LuaBridge.h
//  LuaCocos2D
//
//  Created by Boris Cosic on 10-10-28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LuaBridge : NSObject {}

- (void) run_lua: (NSString *) path;

@end
