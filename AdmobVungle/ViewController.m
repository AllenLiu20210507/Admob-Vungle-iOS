//
//  ViewController.m
//  AdmobVungle
//
//  Created by allen.liu on 2020/2/5.
//  Copyright © 2020 allen.liu. All rights reserved.
//

#import "ViewController.h"
#if defined(__IPHONE_14_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_14_0
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#endif
@interface ViewController ()<GADBannerViewDelegate,GADFullScreenContentDelegate,GADNativeAdDelegate>

@property(nonatomic, strong) GADInterstitialAd *interstitial;
@property(nonatomic, strong) GADRewardedAd *rewardedAd;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
    [self initAdmob];
    // Do any additional setup after loading the view.
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
        }];
    }
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
    
    

     
}

- (void)loadInterstitial {
  
    GADRequest *request = [GADRequest request];
    [GADInterstitialAd loadWithAdUnitID:interstitialPlacement
                                request:request
                      completionHandler:^(GADInterstitialAd *ad, NSError *error) {
      if (error) {
        NSLog(@" Allen Failed to load interstitial ad with error: %@", [error localizedDescription]);
        return;
      }
    self.interstitial = ad;
    self.interstitial.fullScreenContentDelegate = self;
        
        NSLog(@" Allen interstitial ad loaded.");
    }];
}

- (void)playInterstitial {
    if (self.interstitial) {
       [self.interstitial presentFromRootViewController:self];
     } else {
       NSLog(@"Allen Ad wasn't ready");
     }
}

- (void)loadReward {
   
    GADRequest *request = [GADRequest request];
    [GADRewardedAd
         loadWithAdUnitID:rewardPlacement
                  request:request
        completionHandler:^(GADRewardedAd *ad, NSError *error) {
          if (error) {
            NSLog(@" Allen Rewarded ad failed to load with error: %@", [error localizedDescription]);
            return;
          }
          self.rewardedAd = ad;
        self.rewardedAd.fullScreenContentDelegate = self;
          NSLog(@" Allen Rewarded ad loaded.");
        }];
    
}

- (void)playReward {
    if (self.rewardedAd) {
      [self.rewardedAd presentFromRootViewController:self
                                    userDidEarnRewardHandler:^{
                                    GADAdReward *reward =
                                        self.rewardedAd.adReward;
                                    // TODO: Reward the user!
          NSLog(@"Allen userDidEarnRewardHandler");
          
                                  }];
    } else {
      NSLog(@"Allen Ad wasn't ready");
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
    NSLog(@"Allen Ad did fail to present full screen content.");
}

/// Tells the delegate that the ad presented full screen content.
- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    NSLog(@"Allen Ad did present full screen content.");
    
}

/// Tells the delegate that the ad dismissed full screen content.
- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
   NSLog(@"Allen Ad did dismiss full screen content.");
}
@end
