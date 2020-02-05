//
//  AppDelegate.h
//  AdmobVungle
//
//  Created by allen.liu on 2020/2/5.
//  Copyright © 2020 allen.liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

