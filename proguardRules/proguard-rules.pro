# Add project specific ProGuard rules here.
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

-keepattributes Signature
-keepattributes *Annotation*

# retrofit proguard
# Platform calls Class.forName on types which do not exist on Android to determine platform.
-dontnote retrofit2.Platform
# Platform used when running on RoboVM on iOS. Will not be used at runtime.
-dontnote retrofit2.Platform$IOS$MainThreadExecutor
# Platform used when running on Java 8 VMs. Will not be used at runtime.
-dontwarn retrofit2.Platform$Java8
# Retain generic type information for use by reflection by converters and adapters.
-keepattributes Signature
# Retain declared checked exceptions for use by a Proxy instance.
-keepattributes Exceptions
-keepclasseswithmembers class * {
    @retrofit.http.* <methods>;
}

# we need this to keep our model classes

-keepclassmembernames interface * {
    @retrofit.http.* <methods>;
}

#adition
-keep class com.adition.android.sdk.** {*;}
-dontwarn com.adition.android.sdk.**


# Joda Time
-dontwarn org.joda.convert.**
-dontwarn org.joda.time.**
-keep class org.joda.time.** { *; }
-keep interface org.joda.time.** { *; }

#okhttp3
-dontwarn okhttp3.**
-dontnote okhttp3.**

# Okio
-keep class sun.misc.Unsafe { *; }
-dontwarn java.nio.file.*
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-dontwarn okio.**

# crashlytics
-keepattributes SourceFile,LineNumberTable
-keepattributes *Annotation*
-keep public class * extends java.lang.Exception

# event bus method removal stopped, see https://github.com/greenrobot/EventBus/issues/133
-keep,includedescriptorclasses class ** {
public void onEvent*(**);
    void onEvent*(**);}
-keep,includedescriptorclasses class de.greenrobot.event.EventBus { *; }

# facebook conceal
# Keep our interfaces so they can be used by other ProGuard rules.
# See http://sourceforge.net/p/proguard/bugs/466/
# Keep our interfaces so they can be used by other ProGuard rules.
# See http://sourceforge.net/p/proguard/bugs/466/
-keep,allowobfuscation @interface com.facebook.crypto.proguard.annotations.DoNotStrip
-keep,allowobfuscation @interface com.facebook.crypto.proguard.annotations.KeepGettersAndSetters
-dontwarn org.apache.harmony.xnet.provider.jsse.NativeCrypto
-dontnote org.apache.harmony.xnet.provider.jsse.NativeCrypto

# Do not strip any method/class that is annotated with @DoNotStrip
-keep @com.facebook.crypto.proguard.annotations.DoNotStrip class *
-keepclassmembers class * {
    @com.facebook.crypto.proguard.annotations.DoNotStrip *;
}

-keepclassmembers @com.facebook.crypto.proguard.annotations.KeepGettersAndSetters class * {
  void set*(***);
  *** get*();
}


# komensky validation lib
-keepattributes *Annotation*
-keep class eu.inmite.android.lib.validations.form.annotations.** { *; }
-keep class * implements eu.inmite.android.lib.validations.form.iface.ICondition
-keep class * implements eu.inmite.android.lib.validations.form.iface.IValidator
-keep class * implements eu.inmite.android.lib.validations.form.iface.IFieldAdapter
-keepclassmembers class ** {
    @eu.inmite.android.lib.validations.form.annotations.** *;
}

# Adjust
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keep,includedescriptorclasses class com.adjust.sdk.plugin.MacAddressUtil {
    java.lang.String getMacAddress(android.content.Context);
}
-keep,includedescriptorclasses class com.adjust.sdk.plugin.AndroidIdUtil {
    java.lang.String getAndroidId(android.content.Context);
}
-keep,includedescriptorclasses class com.google.android.gms.common.ConnectionResult {
    int SUCCESS;
}

-keep,includedescriptorclasses class com.google.android.gms.ads.identifier.AdvertisingIdClient$Info {
    java.lang.String getId();
    boolean isLimitAdTrackingEnabled();
}

-keep,includedescriptorclasses class com.google.android.gms.ads.identifier.AdvertisingIdClient {
    com.google.android.gms.ads.identifier.AdvertisingIdClient$Info getAdvertisingIdInfo(android.content.Context);
}

-dontnote  android.os.Build
-dontwarn  android.os.Build
-dontnote  com.adjust.sdk.Reflection
-dontwarn  com.adjust.sdk.Reflection
-dontnote  android.os.SystemProperties
-dontwarn android.os.SystemProperties
-dontnote android.os.Build$*
-dontwarn android.os.Build$*
-keep,includedescriptorclasses class com.google.android.gms.dynamite.descriptors.com.google.android.gms.flags.ModuleDescriptor{ *; }
-dontnote  com.google.android.gms.dynamite.descriptors.com.google.android.gms.flags.ModuleDescriptor
-dontwarn  com.google.android.gms.dynamite.descriptors.com.google.android.gms.flags.ModuleDescriptor
-dontnote rx.internal.util.PlatformDependent
-dontwarn rx.internal.util.PlatformDependent

-keep,includedescriptorclasses class com.google.android.gms.measurement.AppMeasurement$*{ *; }
-dontnote   com.google.android.gms.measurement.AppMeasurement$*
-dontwarn   com.google.android.gms.measurement.AppMeasurement$*

-keep,includedescriptorclasses class com.google.firebase.FirebaseApp{ *; }
-dontnote   com.google.android.gms.measurement.AppMeasurement$*
-dontwarn   com.google.android.gms.measurement.AppMeasurement$*

-keep,includedescriptorclasses class com.google.android.gms.common.*{ *; }
-dontnote com.google.android.gms.common.*
-dontwarn com.google.android.gms.common.*
-keep,includedescriptorclasses class com.google.android.gms.dynamic.*{ *; }
-dontnote com.google.android.gms.dynamic.*
-dontwarn com.google.android.gms.dynamic.*

-keep,includedescriptorclasses class com.google.android.gms.dynamite.descriptors.com.google.android.gms.flags.ModuleDescriptor.*{ *; }
-dontnote com.google.android.gms.dynamite.descriptors.com.google.android.gms.flags.ModuleDescriptor.*
-dontwarn com.google.android.gms.dynamite.descriptors.com.google.android.gms.flags.ModuleDescriptor.*
-dontnote com.google.android.gms.internal.*
-dontwarn com.google.android.gms.internal.*


##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature

# For using GSON @Expose annotation
-keepattributes *Annotation*

# Gson specific classes
-keep class sun.misc.Unsafe { *; }
-dontwarn sun.misc.Unsafe
-dontnote sun.misc.Unsafe


# Prevent proguard from stripping interface information from TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
#Note: com.google.gson.internal.UnsafeAllocator accesses a declared field 'theUnsafe' dynamically
-keep class com.google.gson.internal.UnsafeAllocator { java.lang.reflect.Field theUnsafe; }
-dontnote  com.google.gson.internal.UnsafeAllocator
-dontwarn  com.google.gson.internal.UnsafeAllocator


#Resulting Note: the configuration refers to the unknown field 'java.lang.reflect.Field theUnsafe' in class 'com.google.gson.internal.UnsafeAllocator'

# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
# For using GSON @Expose annotation
-keepattributes EnclosingMethod

# Gson specific classes
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.stream.** { *; }
##---------------End: proguard configuration for Gson  ----------

# glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

# don't warn about missing wearable stuff in Adobe's Marketing Cloud
-dontwarn com.adobe.mobile.*Wearable*
-dontwarn com.adobe.mobile.ConfigSynchronizer*
-dontwarn com.adobe.mobile.DataListenerHandheld

# retrolambda
-dontwarn java.lang.invoke.*

# ignore warnings that stem from code coverage code
-dontwarn org.jacoco.**

#zxing
-keep class com.google.zxing.** { *; }

#easing animation lib
-keep class com.daimajia.easing.** { *; }
-keep interface com.daimajia.easing.** { *; }

#Cupboard
# we need this to keep our model classes

  # To support Enum type of class members
  -keep enum * { *; }
## Nineolddroid related classes to ignore

-keep,includedescriptorclasses class com.nineoldandroids.animation.** { *; }
-keep,includedescriptorclasses interface com.nineoldandroids.animation.** { *; }
-keep,includedescriptorclasses class com.nineoldandroids.view.** { *; }
-keep,includedescriptorclasses interface com.nineoldandroids.view.** { *; }

#descriptor classes
# Proximity