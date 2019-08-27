#import "MeiqiachatPlugin.h"

#import <MeiQiaSDK/MQManager.h>
#import <MQChatViewManager.h>

@implementation MeiqiachatPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"meiqiachat"
                                     binaryMessenger:[registrar messenger]];
    MeiqiachatPlugin* instance = [[MeiqiachatPlugin alloc] init];
    // --- add applicationDelegate
    [registrar addApplicationDelegate:instance];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"initMeiqiaSdk" isEqualToString:call.method]) {
    [self initSdk:call.arguments result:result];
  }else if ([@"toChat" isEqualToString:call.method]) {
    [self pushToMeiqiaVCWith:call.arguments];
  }else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)initSdk:(NSString *)appKey result:(FlutterResult)result{
  #pragma mark  集成第一步: 初始化,  参数:appkey  ,尽可能早的初始化appkey.
    [MQManager initWithAppkey:appKey completion:^(NSString *clientId, NSError *error) {
        if (!error) {
          NSLog(@"美洽 SDK：初始化成功");
        } else {
          NSLog(@"error:%@",error);
        }
    }];
}

#pragma mark  集成第五步: 跳转到聊天界面
- (void)pushToMeiqiaVCWith:(NSNumber* ) isPush{

    UIViewController *viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    [chatViewManager setoutgoingDefaultAvatarImage:[UIImage imageNamed:@"meiqia-icon"]];
    if (isPush.boolValue) {
        [chatViewManager pushMQChatViewControllerInViewController:viewController];
    }else {
        [chatViewManager presentMQChatViewControllerInViewController:viewController];
    }
    
}

#pragma mark - AppDelegate
- (void)applicationWillEnterForeground:(UIApplication *)application {
#pragma mark  集成第二步: 进入前台 打开meiqia服务
    [MQManager openMeiqiaService];
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
#pragma mark  集成第三步: 进入后台 关闭美洽服务
    [MQManager closeMeiqiaService];
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
#pragma mark  集成第四步: 上传设备deviceToken
    [MQManager registerDeviceToken:deviceToken];
}

@end
