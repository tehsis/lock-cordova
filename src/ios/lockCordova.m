/********* lockCordova.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <Lock/Lock.h>

@interface lockCordova : CDVPlugin {
  // Member variables go here.
}

- (void)show:(CDVInvokedUrlCommand*)command;
@end

@implementation lockCordova

- (void)show:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
        NSLog(echo);
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
