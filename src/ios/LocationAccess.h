#import <Cordova/CDVPlugin.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationAccess : CDVPlugin

@property(copy) NSString *callbackId;

@property(strong, nonatomic) CLLocationManager *locationManager;

- (void)checkAccess:(CDVInvokedUrlCommand *)command;
@end