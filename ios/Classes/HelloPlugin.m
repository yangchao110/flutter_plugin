#import "HelloPlugin.h"

static FlutterMethodChannel * mChannel;
@implementation HelloPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"hello"
            binaryMessenger:[registrar messenger]];
    mChannel = channel;
  HelloPlugin* instance = [[HelloPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"init" isEqualToString:call.method]){
      result(@"收到");
  }else if ([@"config" isEqualToString:call.method]){
      NSString * value = call.arguments;
      NSString * a = [value stringByAppendingString:@"回来了"];
      NSLog(@"过来了");
      [mChannel invokeMethod:@"configCallBack" arguments:a];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
