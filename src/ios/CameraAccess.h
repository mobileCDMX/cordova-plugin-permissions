//
//  CameraAccess.h
//

#import <Cordova/CDVPlugin.h>
#import <AVFoundation/AVFoundation.h>

@interface CameraAccess : CDVPlugin

@property (copy)   NSString* callbackId;

- (void) checkAccess:(CDVInvokedUrlCommand *)command;
@end
