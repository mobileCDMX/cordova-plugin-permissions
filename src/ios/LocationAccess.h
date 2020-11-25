#import <Cordova/CDVPlugin.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationAccess : CDVPlugin

@property (copy)   NSString* callbackId;

- (void) checkAccess:(CDVInvokedUrlCommand *)command;
@end