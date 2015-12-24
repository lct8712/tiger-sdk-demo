# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/lingchentian/Program/android-sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}


# Retrofit
-keep class com.squareup.okhttp.** { *; }
-keep interface com.squareup.okhttp.** { *; }
-dontwarn com.squareup.okhttp.**

-dontwarn rx.**
-dontwarn retrofit.**
-dontwarn okio.**
-keep class retrofit.** { *; }

-keepclasseswithmembers class * {
  @retrofit.http.* <methods>;
}

-keepclassmembernames interface * {
  @retrofit.http.* <methods>;
}


# Support V7
-keep public class android.support.v7.widget.** { *; }
-keep public class android.support.v7.internal.widget.** { *; }
-keep public class android.support.v7.internal.view.menu.** { *; }

-keep public class * extends android.support.v4.view.ActionProvider {
  public <init>(android.content.Context);
}


# Lombok models
-keep class com.tigerbrokers.open.account.data.model.* { *; }


# Retrolambda
-dontwarn java.lang.invoke.*
-dontwarn java8.util.**


# Umeng
-keep public class * extends com.umeng.**
-keep class com.umeng.** { *; }
-keep public class com.umeng.fb.ui.ThreadView { }
-keep public class com.tigerbrokers.stock.R$* {
  public static final int *;
}
-dontwarn com.umeng.**


# Others
-keep class com.google.gson.** { *; }
-keep class com.google.inject.** { *; }
-keep class org.apache.http.** { *; }
-keep class org.apache.james.mime4j.** { *; }
-keep class org.codehaus.** { *; }
-keep class javax.inject.** { *; }
-keep class retrofit.** { *; }
-keep class package.with.model.classes.** { *; }

-keepattributes Signature
-keepattributes Exceptions

-dontwarn javax.**
-dontwarn org.apache.**
-dontwarn com.squareup.**
-dontwarn com.sun.**
-dontwarn lombok.**
