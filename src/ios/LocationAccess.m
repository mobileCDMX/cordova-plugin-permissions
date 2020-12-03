
#import "LocationAccess.h"

@implementation LocationAccess

@synthesize callbackId;

- (void) checkAccess:(CDVInvokedUrlCommand *)command {

    // Check for permission
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];

    CDVPluginResult* result = nil;
    @try {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:1];
        /* Location is only requested if not determined */
        switch (status) {
            case kCLAuthorizationStatusNotDetermined:
                /* The user hasn't yet chosen whether your app can use location services or not.*/
                self.locationManager = [[CLLocationManager alloc] init];
                self.locationManager.delegate = self;
                [self.locationManager requestWhenInUseAuthorization];
                break;
            case kCLAuthorizationStatusAuthorizedAlways:
                /* The user has let your app use location services all the time, even if the app is in the background. */
            case kCLAuthorizationStatusAuthorizedWhenInUse:
                /* The user has let your app use location services only when the app is in the foreground. */
                NSLog(@"Access to location granted");
                [dict setObject:[NSNumber numberWithBool:YES] forKey:@"hasPermission"];
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
                [self invokeCallback:command withResult:result];
                break;
                
            case kCLAuthorizationStatusRestricted:
                /* The user can't choose whether or not your app can use location services or not, this could be due to parental controls for example. */
            case kCLAuthorizationStatusDenied:
                /* The user has chosen to not let your app use location services. */
                NSLog(@"Access to location denied");
                [dict setObject:[NSNumber numberWithBool:NO] forKey:@"hasPermission"];
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
                [self invokeCallback:command withResult:result];
                break;

            default:
                NSLog(@"Access to location denied");
                [dict setObject:[NSNumber numberWithBool:NO] forKey:@"hasPermission"];
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
                [self invokeCallback:command withResult:result];
                break;
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