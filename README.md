
# Admob iOS Mediation with Vungle SDK
This is a sample project by using mediation Admob include Ad-Network Vungle.

## Goal
This project may help to reproduce issues and narrow down the root cause.

## Getting Started
1.This project is not include the app id and placement ids.
Go to the file Constant.m and input your placement ids:
```
NSString* const interstitialPlacement = @"";
NSString* const rewardPlacement = @"";
NSString* const bannerPlacement = @""; // Requires SDK 6.5+
```
2.Update your Info.plist
Update your Admob AppId in your Info.plist

3.Run the commmand below with your terminal
```
pod install --repo-update
```

You should good to go now!

## Manually Integration
1. Check out a new branch
2. Comment Podfile frameworks as below
```
# comment below lines
pod 'Google-Mobile-Ads-SDK'
pod 'GoogleMobileAdsMediationVungle'
```
3. Run pod install to remove the frameworks from the project
4. Integrate frameworks manually

## For more details, please check 
integration document


## Tested Version
Admob + Vungle + Adapter:
7.53.1 + 6.4.6 + 6.4.6

