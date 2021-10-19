//
//  MrecVC.m
//  AdmobVungle
//
//  Created by allen.liu on 2020/9/15.
//  Copyright © 2020 allen.liu. All rights reserved.
//

#import "MrecVC.h"

@interface MrecVC ()<GADBannerViewDelegate>
@property (nonatomic) GADBannerView *mrecView;
@end

@implementation MrecVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
}


- (void)createView {
    self.view.backgroundColor = UIColor.whiteColor;
    
    float x = (self.view.bounds.size.width - 320) / 2;
    
    // Create MPAdView instance
    
    
    self.mrecView = [[GADBannerView alloc]
              initWithAdSize:kGADAdSizeMediumRectangle];
    self.mrecView.adUnitID = mrecPlacement;
    self.mrecView.rootViewController = self;
    self.mrecView.delegate = self;
    [self addBannerViewToView:self.mrecView];
    
    UIButton *loadmRrec = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadmRrec.frame = CGRectMake(x, 120, 320, 80);
    [loadmRrec setTitle:@"Load & Play Mrec" forState:UIControlStateNormal];
    [loadmRrec addTarget:self action:@selector(loadMREC) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:loadmRrec];
    

   
}

#pragma mark - addBannerView
- (void)addBannerViewToView:(UIView *)bannerView {
  bannerView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:bannerView];
  [self.view addConstraints:@[
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeTop
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.topLayoutGuide
                               attribute:NSLayoutAttributeTop
                              multiplier:1
                                constant:0],
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.view
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1
                                constant:0]
                                ]];
}

#pragma mark - load & play
- (void)loadMREC {
     NSLog(@"loadMREC");
    // automatically refreshes an ad unit at a time interval specified via the MoPub web interface
    [self.mrecView loadRequest:[GADRequest request]];
}


#pragma mark Tells the delegate an ad request loaded an ad.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
  NSLog(@"adViewDidReceiveAd");
}

#pragma mark Tells the delegate an ad request failed.
//- (void)adView:(GADBannerView *)adView
//    didFailToReceiveAdWithError:(GADRequestError *)error {
//  NSLog(@"adView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
//}

#pragma mark Tells the delegate that a full-screen view will be presented in response
#pragma mark to the user clicking on an ad.
- (void)adViewWillPresentScreen:(GADBannerView *)adView {
  NSLog(@"adViewWillPresentScreen");
}

#pragma mark Tells the delegate that the full-screen view will be dismissed.
- (void)adViewWillDismissScreen:(GADBannerView *)adView {
  NSLog(@"adViewWillDismissScreen");
}

#pragma mark Tells the delegate that the full-screen view has been dismissed.
- (void)adViewDidDismissScreen:(GADBannerView *)adView {
  NSLog(@"adViewDidDismissScreen");
}

#pragma mark Tells the delegate that a user click will open another app (such as
#pragma mark the App Store), backgrounding the current app.
- (void)adViewWillLeaveApplication:(GADBannerView *)adView {
  NSLog(@"adViewWillLeaveApplication");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
