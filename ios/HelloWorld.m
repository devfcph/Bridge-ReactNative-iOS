//
//  HelloWorld.m
//  DuHast
//
//  Created by Francisco Perez on 05/09/22.
//  Copyright © 2022 Facebook. All rights reserved.
//


#import <Foundation/Foundation.h>

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(HelloWorld, NSObject)
  RCT_EXTERN_METHOD(ShowMessage:(NSString *)message duration:(double *)duration)
@end
