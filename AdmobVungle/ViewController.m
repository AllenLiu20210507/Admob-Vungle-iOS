//
//  ViewController.m
//  AdmobVungle
//
//  Created by allen.liu on 2020/2/5.
//  Copyright © 2020 allen.liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<GADBannerViewDelegate,GADRewardBasedVideoAdDelegate,GADInterstitialDelegate>

@property(nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
    [self initAdmob];
}

- (void)createView {
    float screenWidth = self.view.bounds.size.width;
    float x = screenWidth/2-100;
    float y = 100;
    float btnWidth = 200;
    float btnHeight = 50;
    
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(x, y - 50, btnWidth, btnHeight);
    title.text = @"Admob + Vungle";
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];
    
    UIButton *loadInterstitialBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadInterstitialBtn.frame = CGRectMake(x, y, btnWidth, btnHeight);
    [loadInterstitialBtn setTitle:@"Load Interstitial" forState:UIControlStateNormal];
    [loadInterstitialBtn addTarget:self action:@selector(loadInterstitial) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *playIntersititalBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playIntersititalBtn.frame = CGRectMake(x, y + 50, btnWidth, btnHeight);
    [playIntersititalBtn setTitle:@"Play Interstitial" forState:UIControlStateNormal];
    [playIntersititalBtn addTarget:self action:@selector(playInterstitial) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *loadRewardBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadRewardBtn.frame = CGRectMake(x, y + 100, btnWidth, btnHeight);
    [loadRewardBtn setTitle:@"Load Reward" forState:UIControlStateNormal];
    [loadRewardBtn addTarget:self action:@selector(loadReward) forControlEvents:UIControlEventTouchUpInside];

    UIButton *playRewardBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playRewardBtn.frame = CGRectMake(x, y + 150, btnWidth, btnHeight);
    [playRewardBtn setTitle:@"Play Reward" forState:UIControlStateNormal];
    [playRewardBtn addTarget:self action:@selector(playReward) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *goBannerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBannerBtn.frame = CGRectMake(x, y + 200, btnWidth, btnHeight);
    [goBannerBtn setTitle:@"Go Banner(Requires SDK 6.5+)" forState:UIControlStateNormal];
    [goBannerBtn addTarget:self action:@selector(goBanner) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *goMrecBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goMrecBtn.frame = CGRectMake(x, y + 300, btnWidth, btnHeight);
    [goMrecBtn setTitle:@"Go MREC(Requires SDK 6.5+)" forState:UIControlStateNormal];
    [goMrecBtn addTarget:self action:@selector(goMrec) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loadInterstitialBtn];
    [self.view addSubview:playIntersititalBtn];
    [self.view addSubview:loadRewardBtn];
    [self.view addSubview:playRewardBtn];
    [self.view addSubview:goBannerBtn];
    [self.view addSubview:goMrecBtn];
}



# pragma mark - admob init, load & play
- (void)initAdmob {
    [GADRewardBasedVideoAd sharedInstance].delegate = self;
      self.interstitial = [[GADInterstitial alloc]
      initWithAdUnitID:interstitialPlacement];
      self.interstitial.delegate = self;
}

- (void)loadInterstitial {
    GADRequest *request = [GADRequest request];
     [self.interstitial loadRequest:request];
}

- (void)playInterstitial {
    if (self.interstitial.isReady) {
      [self.interstitial presentFromRootViewController:self];
    } else {
      NSLog(@"Ad wasn't ready");
    }
}

- (void)loadReward {
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request]
    withAdUnitID:rewardPlacement];
}

- (void)playReward {
    if ([[GADRewardBasedVideoAd sharedInstance] isReady]) {
      [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:self];
    }
}
- (void)goBanner {
   BannerVC *bannerVC = [[BannerVC alloc] init];
    [self presentViewController:bannerVC animated:YES completion:nil];
}

- (void)goMrec {
   MrecVC *mrecVC = [[MrecVC alloc] init];
    [self presentViewController:mrecVC animated:YES completion:nil];
}


#pragma mark Tells the delegate that the user earned a reward.
- (void)rewardedAd:(GADRewardedAd *)rewardedAd userDidEarnReward:(GADAdReward *)reward {
  // TODO: Reward the user.
  NSLog(@"rewardedAd:userDidEarnReward:");
}

#pragma mark Tells the delegate that the rewarded ad was presented.
- (void)rewardedAdDidPresent:(GADRewardedAd *)rewardedAd {
  NSLog(@"rewardedAdDidPresent:");
}

#pragma mark Tells the delegate that the rewarded ad failed to present.
- (void)rewardedAd:(GADRewardedAd *)rewardedAd didFailToPresentWithError:(NSError *)error {
  NSLog(@"rewardedAd:didFailToPresentWithError");
}

#pragma mark Tells the delegate that the rewarded ad was dismissed.
- (void)rewardedAdDidDismiss:(GADRewardedAd *)rewardedAd {
  NSLog(@"rewardedAdDidDismiss:");
}




#pragma mark Tells the delegate an ad request succeeded.
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
  NSLog(@"interstitialDidReceiveAd");
}

#pragma mark Tells the delegate an ad request failed.
- (void)interstitial:(GADInterstitial *)ad
    didFailToReceiveAdWithError:(GADRequestError *)error {
  NSLog(@"interstitial:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

#pragma mark Tells the delegate that an interstitial will be presented.
- (void)interstitialWillPresentScreen:(GADInterstitial *)ad {
  NSLog(@"interstitialWillPresentScreen");
}

#pragma mark Tells the delegate the interstitial is to be animated off the screen.
- (void)interstitialWillDismissScreen:(GADInterstitial *)ad {
  NSLog(@"interstitialWillDismissScreen");
}

#pragma mark Tells the delegate the interstitial had been animated off the screen.
- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
  NSLog(@"interstitialDidDismissScreen");
}

#pragma mark Tells the delegate that a user click will open another app
#pragma mark (such as the App Store), backgrounding the current app.
- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad {
  NSLog(@"interstitialWillLeaveApplication");
}
@end
