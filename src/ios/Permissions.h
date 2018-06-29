#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>

#import <mach/machine.h>
#import <sys/types.h>
#import <sys/sysctl.h>

// Public constants
extern NSString*const UNKNOWN;

extern NSString*const AUTHORIZATION_NOT_DETERMINED;
extern NSString*const AUTHORIZATION_DENIED;
extern NSString*const AUTHORIZATION_GRANTED;

@interface Diagnostic : CDVPlugin
    
    @property (nonatomic) float osVersion;
    @property (nonatomic) BOOL debugEnabled;
    
    + (id) getInstance;
@end