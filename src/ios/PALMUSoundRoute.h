#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDV.h>

@interface PALMUSoundRoute : CDVPlugin

@property (nonatomic, strong) AVAudioSession* avSession;

- (void)setCurrentOutput:(CDVInvokedUrlCommand*)command;

@end