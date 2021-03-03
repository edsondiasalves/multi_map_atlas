<h1>A Flutter multi map provider using Atlas</h1>

This flutter project uses Atlas to handle different map providers in the same application.
</br>
</br>
<div align="center">
<image src="https://user-images.githubusercontent.com/13770341/109850005-ee747b00-7c49-11eb-8073-8bc7da72a696.gif" />
</div>

## Getting Started

### Clone the project:
* `git clone https://github.com/edsondiasalves/multi_map_atlas.git`
### Enter into the root directory:
- `cd multi_map_atlas`
### Download the dependencies:
* `flutter pub get`
### Download the heresdk ios framework manually:
>Since the [heresdk ios framework file](https://github.com/edsondiasalves/here_sdk/blob/main/ios/Frameworks/heresdk.framework/heresdk) uses git lfs to be hosted in github, you need to download it manually to the flutter dependency directory: `/Users/[YOUR-USER]/.pub-cache/git/here_sdk-[REFERENCE]/ios/Frameworks/heresdk.framework/`
### Set the credentials
#### For getting your Google API Key sign up to the [Google Cloud](https://cloud.google.com/)
#### For getting you MapBox API Key sign up to the [Mapbox](https://mapbox.com/)
#### For getting you Here API Key and Secret sign up to the [Here Developer Portal](https://developer.here.com/#)

#### Ios:
> In the `ios/Runner/Info.plist` file change the highlighted value
+ Here Maps
####
```
<key>HERECredentials</key>
      <dict>
          <key>AccessKeyId</key>
          <string>[PUT YOUR KEY HERE]</string>
          <key>AccessKeySecret</key>
          <string>[PUT YOUR SECRET HERE]</string>
      </dict>
```
+ Mapbox
```
<key>MGLMapboxAccessToken</key>
<string>[PUT YOUR TOKEN HERE]</string>
```
+ Google Maps
> In the `ios/Runner/AppDelegate.swift` file change the highlighted value
```
GMSServices.provideAPIKey("[PUT YOUR API KEY HERE]")
```

#### Android:
> In the `app/src/main/AndroidManifest.xml` file change the API Key
+ Here Maps
```
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="here_maps_atlas"
        android:icon="@mipmap/ic_launcher">

        <meta-data android:name="com.here.sdk.access_key_id" android:value="[PUT YOUR KEY KERE]"/>
        <meta-data android:name="com.here.sdk.access_key_secret" android:value="[PUT YOUR SECRET HERE]"/>

```
+ MapBox
```
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="mapbox_atlas"
        android:icon="@mipmap/ic_launcher">

        <meta-data android:name="com.mapbox.token" 
          android:value="[PUT YOUR TOKEN HERE]" />

```
+ Google Maps
```
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="google_maps_atlas"
        android:icon="@mipmap/ic_launcher">

        <meta-data android:name="com.google.android.geo.API_KEY"
            android:value="[PUT YOUR API KEY HERE]"/>

```
### Run the project:
* `flutter run lib/src/main.dart`