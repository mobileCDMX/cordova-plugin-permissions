#import "Permissions.h"

@implementation Permissions

    static Permissions* Permissions = nil;

    /********************************/
    #pragma mark - Public static functions
    /********************************/
    
    + (id) getInstance{
        return Permissions;
    }
    
    /********************************/
    #pragma mark - Internal functions
    /********************************/

    - (void)pluginInitialize {

        [super pluginInitialize];

        Permissions = self;

        self.debugEnabled = false;
        self.osVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    }

@end