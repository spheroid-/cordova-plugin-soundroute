#import "PALMUSoundRoute.h"

@implementation PALMUSoundRoute

- (void)setCurrentOutput:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
	AVAudioSession* session = [AVAudioSession sharedInstance];
    NSError* error = nil;
    BOOL success;

	success = [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];

   	if (!success) {
   		NSLog(@"AVAudioSession error setting category:%@",error);
   	}

	NSString* port = [command.arguments objectAtIndex:0];

	if ([port isEqualToString:@"Receiver"]) {
		success = [session overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:&error];
	} else if ([port isEqualToString:@"Speaker"]) {
		success = [session overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:&error];
	}

	if (!success) {
		NSLog(@"AVAudioSession error overrideOutputAudioPort:%@", error);
	}

    success = [session setActive:YES error:&error];
    
    if (!success) {
    	NSLog(@"AVAudioSession error activating: %@", error);
    	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    } else {
    	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];	
    }

	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end