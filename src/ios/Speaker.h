#import <Cordova/CDVPlugin.h>

@interface Speaker : CDVPlugin
- (void)on:(CDVInvokedUrlCommand*)command;
- (void)off:(CDVInvokedUrlCommand*)command;
- (void)route:(CDVInvokedUrlCommand*)command;
@end
