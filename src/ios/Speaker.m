#import "Speaker.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation Speaker

- (void)on:(CDVInvokedUrlCommand *)command
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self setAudioOutputSpeaker:true];
    });
}

- (void)off:(CDVInvokedUrlCommand *)command
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self setAudioOutputSpeaker:false];
    });
}

- (void)setAudioOutputSpeaker:(BOOL)enabled
 {
     AVAudioSession *session = [AVAudioSession sharedInstance];

     NSLog(@"Speaker:Category: %@", session.category);
     NSLog(@"Speaker:Mode: %@", session.mode);
     NSLog(@"Speaker:Route: %@", session.currentRoute.outputs.firstObject.portName);

     NSError *error;

     [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
     [session setMode:AVAudioSessionModeVoiceChat error:&error];
     if (enabled)
     {
        [session overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
        NSLog(@"Speaker:Speaker:Enabled");
     }
     else
     {
         [session overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:nil];
         NSLog(@"Speaker:Speaker:Disabled");
     }
     [session setActive:YES error:&error];
 }

- (void)route:(CDVInvokedUrlCommand*)command
 {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[session.currentRoute.outputs.firstObject.portName lowercaseString]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
 }

@end
