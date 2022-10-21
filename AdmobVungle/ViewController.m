//
//  ViewController.m
//  AdmobVungle
//
//  Created by allen.liu on 2020/2/5.
//  Copyright © 2020 allen.liu. All rights reserved.
//

#import "ViewController.h"
@import GoogleMobileAdsMediationTestSuite;
@interface ViewController ()<GADBannerViewDelegate,GADFullScreenContentDelegate,GADVideoControllerDelegate>

@property(nonatomic, strong) GADInterstitialAd *interstitial;
@property(nonatomic, strong) GADRewardedAd *rewardedAd;
@end

@implementation ViewController

- (void)viewDidLoad {
  

    [super viewDidLoad];
    // Do any additional setup after loading the view.
  

    [self createView];
    [self initAdmob];
 
}

- (void)viewDidAppear:(BOOL)animated{
//  GADMobileAds.sharedInstance.requestConfiguration.testDeviceIdentifiers =
//      @[ @"2077ef9a63d2b398840261c8221a0c9b"  ]; // Sample device ID
//  [GADMobileAds.sharedInstance presentAdInspectorFromViewController:self
//    completionHandler:^(NSError *error) {
//      // Error will be non-nil if there was an issue and the inspector was not displayed.
//  }];
  [GoogleMobileAdsMediationTestSuite presentOnViewController:self delegate:nil];
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
//    self.rewardedAd = [[GADRewardedAd alloc]
//          initWithAdUnitID:rewardPlacement];
//      self.interstitial = [[GADInterstitial alloc]
//      initWithAdUnitID:interstitialPlacement];
//      self.interstitial.delegate = self;
}

- (void)loadInterstitial {
  GADRequest *request = [GADRequest request];
  [GADInterstitialAd loadWithAdUnitID:@"ca-app-pub-3940256099942544/4411468910"
                              request:request
                    completionHandler:^(GADInterstitialAd *ad, NSError *error) {
    if (error) {
      NSLog(@"Failed to load interstitial ad with error: %@", [error localizedDescription]);
      return;
    }
    self.interstitial = ad;
  }];
}

- (void)playInterstitial {
  if (self.interstitial) {
     [self.interstitial presentFromRootViewController:self];
   } else {
     NSLog(@"Ad wasn't ready");
   }
}

- (void)loadReward {
  GADRequest *request = [GADRequest request];
  [GADRewardedAd
       loadWithAdUnitID:@"ca-app-pub-3940256099942544/1712485313"
                request:request
      completionHandler:^(GADRewardedAd *ad, NSError *error) {
        if (error) {
          NSLog(@"Rewarded ad failed to load with error: %@", [error localizedDescription]);
          return;
        }
        self.rewardedAd = ad;
        NSLog(@"Rewarded ad loaded.");
      }];
}

- (void)playReward {
  if (self.rewardedAd) {
     [self.rewardedAd presentFromRootViewController:self
                                   userDidEarnRewardHandler:^{
                                   GADAdReward *reward =
                                       self.rewardedAd.adReward;
                                   // TODO: Reward the user!
                                 }];
   } else {
     NSLog(@"Ad wasn't ready");
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


  /// Tells the delegate that the ad failed to present full screen content.
  - (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
  didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
      NSLog(@"Ad did fail to present full screen content.");
  }

  /// Tells the delegate that the ad will present full screen content.
  - (void)adWillPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
      NSLog(@"Ad will present full screen content.");
  }

  /// Tells the delegate that the ad dismissed full screen content.
  - (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
     NSLog(@"Ad did dismiss full screen content.");
  }




@end
