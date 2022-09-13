//
//  HelloWorld.m
//  BridgeOne
//
//  Created by Francisco Perez on 07/09/22.
//  OOOOOK, ESTO FUNCIONA


#import <Foundation/Foundation.h>

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(HelloWorld, NSObject)
  RCT_EXTERN_METHOD(ShowMessage:(NSString *)message duration:(double *)duration);
@end

