
# Admob iOS Mediation with Vungle SDK
This is a sample project by using mediation Admob include Ad-Network Vungle.

## Goal
This project may help to reproduce issues and narrow down the root cause.

## Getting Started
-This project is not include the app id and placement ids.
Go to the file Constant.m and input your placement ids:
```
NSString* const interstitialPlacement = @"";
NSString* const rewardPlacement = @"";
NSString* const bannerPlacement = @""; // Requires SDK 6.5+
```
-Update your Info.plist
Update your Admob AppId in your Info.plist

- Delete the Podfile.lock 
- Run the commmand below with your terminal

```
pod install --repo-update
```

You should good to go now!

## TIP
Master verison always be the latest version from Admob.

