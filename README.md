[![Build Status](https://travis-ci.org/lct8712/tiger-sdk-demo.svg)](https://travis-ci.org/lct8712/tiger-sdk-demo)
# TigerBrokers 开户 SDK 使用说明

[老虎证券](https://www.tigerbrokers.com/)是一家为客户提供美股开户以及交易的美股券商，支持融资融券以及 T+0 交易。通过本 SDK ，用户可以完成老虎证券的开户资料的提交，以及开户进度的查询。

# 接入方式

## 拷贝文件

将「tiger-sdk-account.aar」和「idcardquality_v1.0.2.jar」两个文件拷贝到项目的 libs 目录下

```
| — app
|    | — libs
|    |    | - tiger-sdk-account.aar
|    |    | - idcardquality_v1.0.2.jar
```

## 配置 Gradle

在 project 的 build.gradle 文件中添加依赖

```
dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])
    compile(name: 'account-release', ext: 'aar')

    compile 'com.android.support:design:23.1.1'
    compile 'com.umeng.analytics:analytics:latest.integration'

    compile 'com.squareup.retrofit:retrofit:2.0.0-beta2'
    compile 'com.squareup.retrofit:converter-gson:2.0.0-beta2'
}
```

TigerBrokers 开户 SDK 使用 [Android Support Design Library](http://developer.android.com/tools/support-library/index.html) 绘制界面；使用[友盟](http://www.umeng.com/analytics)统计数据；使用 [Retrofit2](http://square.github.io/retrofit/) 作为网络库；所以需要添加对它们的依赖。如果您的项目已经依赖于这些库，则不必重复添加。

## 添加权限

SDK 会调用设备的摄像头，访问网络，以及一些必要的数据存储。在「AndroidManifest.xml」文件中添加以下的权限申请。

```
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

## 添加代码

### 初始化

在全局的 Application 对象中添加如下代码：

```
@Override
public void onCreate() {
  super.onCreate();
  AccountContext.init(this);
}

@Override
public void onTerminate() {
  super.onTerminate();
  AccountContext.destroy();
}
```

当然，也可以在主 Activity 对应的生命周期函数中添加，但不推荐这样做。

### 调起注册界面

只需要调用这样一个函数即可：

```
AccountContext.start(getActivity());
```

传入的参数是当前 Activity 的实例。

### 直接调起开户界面（高级用法，内部使用）

对于已经在 app 内登录的用户，可以跳过注册和登录页面，让这些用户直接进入开户的流程，调用方法是：

```
AccountContext.start(getActivity(), "accessToken", statusCode);
```

其中，accessToken 登录时由服务端返回；状态码是 「account/status」 接口中服务端返回的 code 字段，详见文档：[SDK 开户落地页面状态描述](https://tigerbrokers.quip.com/14MAAOpatqU5)

## 其他

### Proguard

如果您的项目使用了 Proguard 进行打包混淆，建议参照 demo 中的 proguard-rules.pro 进行添加

### 使用限制

为防止 SDK 被滥用，我们通过包名对第三方接入进行了一些限制。如果您程序的包名不在我们的白名单中，请[联系我们](mailto:chenjinkun@tigerbrokers.com)进行合作洽谈。

### minSdkVersion

我们支持的最低版本是 API Level 14，即 Android 4.0。

## Demo

我们提供了一个完整的例子，用 Android Studio 打开即可运行：
https://github.com/lct8712/tiger-sdk-demo

# 程序截图

以下是部分步骤的截图：
![screenshot1](https://raw.githubusercontent.com/lct8712/tiger-sdk-demo/master/screenshot/01.jpg)

