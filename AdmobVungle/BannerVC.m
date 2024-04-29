////
////  BannerVC.m
////  admobvunglesample
////
////  Created by allen.liu on 2020/1/13.
////  Copyright © 2020 allen.liu. All rights reserved.
////
//
//#import "BannerVC.h"
//@import GoogleMobileAds;
//@interface BannerVC ()<GADBannerViewDelegate>
//@property (nonatomic) GADBannerView *bannerView;
//
//@end
//
//@implementation BannerVC
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    [self createView];
//}
//
//
//- (void)createView {
//    self.view.backgroundColor = UIColor.whiteColor;
//    
//    float x = (self.view.bounds.size.width - 320) / 2;
//    
//    // Create MPAdView instance
//    
//    
//    self.bannerView = [[GADBannerView alloc]
//                       initWithAdSize:GADAdSizeBanner];
//    self.bannerView.adUnitID = bannerPlacement;
//    self.bannerView.rootViewController = self;
//    self.bannerView.delegate = self;
//    [self addBannerViewToView:self.bannerView];
//    
//    UIButton *loadBanner = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    loadBanner.frame = CGRectMake(x, 120, 320, 80);
//    [loadBanner setTitle:@"Load & Play Banner" forState:UIControlStateNormal];
//    [loadBanner addTarget:self action:@selector(loadBanner) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    [self.view addSubview:loadBanner];
//    
//
//   
//}
//
//#pragma mark - addBannerView
//- (void)addBannerViewToView:(UIView *)bannerView {
//  bannerView.translatesAutoresizingMaskIntoConstraints = NO;
//  [self.view addSubview:bannerView];
//  [self.view addConstraints:@[
//    [NSLayoutConstraint constraintWithItem:bannerView
//                               attribute:NSLayoutAttributeTop
//                               relatedBy:NSLayoutRelationEqual
//                                  toItem:self.topLayoutGuide
//                               attribute:NSLayoutAttributeTop
//                              multiplier:1
//                                constant:0],
//    [NSLayoutConstraint constraintWithItem:bannerView
//                               attribute:NSLayoutAttributeCenterX
//                               relatedBy:NSLayoutRelationEqual
//                                  toItem:self.view
//                               attribute:NSLayoutAttributeCenterX
//                              multiplier:1
//                                constant:0]
//                                ]];
//}
//
//#pragma mark - load & play
//- (void)loadBanner {
//      NSLog(@"loadBanner");
//    // automatically refreshes an ad unit at a time interval specified via the MoPub web interface
//    [self.bannerView loadRequest:[GADRequest request]];
//}
//
//
//#pragma mark Tells the delegate an ad request loaded an ad.
//- (void)adViewDidReceiveAd:(GADBannerView *)adView {
//  NSLog(@"adViewDidReceiveAd");
//}
//
//#pragma mark Tells the delegate an ad request failed.
//- (void)adView:(GADBannerView *)adView
//    didFailToReceiveAdWithError:(GADRequestError *)error {
//  NSLog(@"adView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
//}
//
//#pragma mark Tells the delegate that a full-screen view will be presented in response
//#pragma mark to the user clicking on an ad.
//- (void)adViewWillPresentScreen:(GADBannerView *)adView {
//  NSLog(@"adViewWillPresentScreen");
//}
//
//#pragma mark Tells the delegate that the full-screen view will be dismissed.
//- (void)adViewWillDismissScreen:(GADBannerView *)adView {
//  NSLog(@"adViewWillDismissScreen");
//}
//
//#pragma mark Tells the delegate that the full-screen view has been dismissed.
//- (void)adViewDidDismissScreen:(GADBannerView *)adView {
//  NSLog(@"adViewDidDismissScreen");
//}
//
//#pragma mark Tells the delegate that a user click will open another app (such as
//#pragma mark the App Store), backgrounding the current app.
//- (void)adViewWillLeaveApplication:(GADBannerView *)adView {
//  NSLog(@"adViewWillLeaveApplication");
//}
//@end
