package com.kefu.ding.meiqiachat;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import android.content.Intent;

import com.meiqia.core.MQManager;
import com.meiqia.core.callback.OnInitCallback;
import com.meiqia.meiqiasdk.util.MQConfig;
import com.meiqia.meiqiasdk.util.MQIntentBuilder;


/** MeiqiachatPlugin */
public class MeiqiachatPlugin implements MethodCallHandler {

  /// 获取context
  private Registrar registrar;
  private MethodChannel channel;
  public static MeiqiachatPlugin instance;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "meiqiachat");
    channel.setMethodCallHandler(new MeiqiachatPlugin(registrar,channel));
  }

  private MeiqiachatPlugin(Registrar registrar,MethodChannel channel) {
    this.registrar = registrar;
    this.channel = channel;
    instance = this;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("initMeiqiaSdk")) {
      setup(call, result);
    } else if (call.method.equals("toChat")) {
      toChat(call, result);
    } else {
      result.notImplemented();
    }
  }

  /**
  * 初始化sdk
  */ 
  public void setup(MethodCall call, Result result) {
    MQManager.setDebugMode(true);
    String meiqiaKey = call.arguments.toString();
    MQConfig.init(registrar.context(), meiqiaKey, new OnInitCallback() {
        @Override
        public void onSuccess(String clientId) {
        }
        @Override
        public void onFailure(int code, String message) {
        }
    });
  }

  /**
  * 初始化聊天页面 isPush 为 iOS 跳转方式 默认present 
  */ 
  public void toChat(MethodCall call, Result result) {
    Intent intent = new MQIntentBuilder(registrar.context()).build();
    registrar.context().startActivity(intent);
  }
  
}
