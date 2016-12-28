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
    A0Lock *lock = [A0Lock sharedLock];
    A0LockViewController *controller = [lock newLockViewController];
    controller.onAuthenticationBlock = ^(A0UserProfile *profile, A0Token *token) {
        // Do something with token & profile. e.g.: save them.
        // Lock will not save the Token and the profile for you.
        // And dismiss the UIViewController.
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [lock presentLockController:controller fromController:self];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
        NSLog(echo);
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
