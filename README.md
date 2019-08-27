# meiqiachat

简书教程 https://www.jianshu.com/p/e05f54ab2ecc

美洽客服移动sdk3.5.8 接入 适配iOS、android 针对工作上需求会酌情继续 添加相应功能
如有交流敬请邮箱联系loselfmin@gmail.com

实现功能
1、初始化sdk
2、启动对话页面

iOS 真机如果出现语言没有跟随系统可以添加
```
<key>CFBundleLocalizations</key>
<array>
<string>zh_CN</string>
<string>zh_TW</string>
<string>en</string>
</array>
```
到info.plist中

## 简单使用

1、初始化sdk
在项目 main.dart 初始化时候初始化
```
@override
void initState() {
super.initState();
initMeiqia();
}

Future<void> initMeiqia() async {
try {
await Meiqiachat.initMeiqiaSdkWith(
appkey);
} catch (e) {}
}
```

2、启动聊天页面

```
void _toChat() async{
try {
<!-- isPush 为iOS的跳转状态 默认为present -->
await Meiqiachat.toChat(isPush: true);
} catch (e){}
}
```
