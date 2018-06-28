//
//  CameraAccess.m
//

#import "CameraAccess.h"

@implementation CameraAccess

@synthesize callbackId;

- (void) checkAccess:(CDVInvokedUrlCommand *)command {

    // Check for permission
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];

    CDVPluginResult* result = nil;
    @try {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:1];
        if (authStatus == AVAuthorizationStatusAuthorized) {
            NSLog(@"Access to camera granted");
            [dict setObject:[NSNumber numberWithBool:YES] forKey:@"hasPermission"];
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
            [self invokeCallback:command withResult:result];
        }
        else if (authStatus == AVAuthorizationStatusNotDetermined) {
            NSLog(@"Access to camera not yet determined. Will ask user.");
            __block CDVPluginResult* result = nil;

            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if(granted) {
                    NSLog(@"Granted access to %@", AVMediaTypeVideo);
                    [dict setObject:[NSNumber numberWithBool:YES] forKey:@"hasPermission"];
                    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
                    [self invokeCallback:command withResult:result];
                }
                else {
                    NSLog(@"Not granted access to %@", AVMediaTypeVideo);
                    [dict setObject:[NSNumber numberWithBool:NO] forKey:@"hasPermission"];
                    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
                    [self invokeCallback:command withResult:result];
                }
            }];
        }
        else {
            NSLog(@"Access to camera denied");
            [dict setObject:[NSNumber numberWithBool:NO] forKey:@"hasPermission"];
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
            [self invokeCallback:command withResult:result];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Access denied"];
        [self invokeCallback:command withResult:result];
    }
}

- (void) invokeCallback:(CDVInvokedUrlCommand *)command withResult:(CDVPluginResult *)result {
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
