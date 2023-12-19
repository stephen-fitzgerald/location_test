# location_test

A simple working example of creating a service to provide an app with 
location data via provider.

Dependencies: location: ^5.0.3 & provider: ^6.1.1

Has only been run on iOS to date, and needs these setting changed.  

    /ios/Runner/info.plist

	<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
	<string>Need to know where you're at - always and when in use!</string>
	<key>NSLocationAlwaysUsageDescription</key>
	<string>Need to know where you're at - always!</string>
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>Need to know where you're at - when in use!</string>

    /ios/Runner.xcodeproj/project.pbxproj
	ENABLE_USER_SCRIPT_SANDBOXING = NO; /* several places */

It should run on android, but may need some settings updated in these files.

    /android/app/src/debug/AndroidManifest.xml
    /android/app/src/main/AndroidManifest.xml
    /android/app/src/profile/AndroidManifest.xml

    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <!-- not sure these two are required -->
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
