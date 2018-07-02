#import "Permissions.h"

@implementation Permissions

    static Permissions* permissions = nil;

    /********************************/
    #pragma mark - Public static functions
    /********************************/
    
    + (id) getInstance{
        return permissions;
    }
    
    /********************************/
    #pragma mark - Internal functions
    /********************************/

    - (void)pluginInitialize {

        [super pluginInitialize];

        permissions = self;

        self.debugEnabled = false;
        self.osVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    }

@end