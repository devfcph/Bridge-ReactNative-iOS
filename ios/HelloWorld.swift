//
//  HelloWorld.swift
//  DuHast
//
//  Created by Francisco Perez on 05/09/22.
//  Copyright © 2022 Facebook. All rights reserved.
//


import Foundation
import UIKit

@objc(HelloWorld) // Module Name

class HelloWorld : NSObject, RCTBridgeModule {
  
  
  static func moduleName() -> String!{
    return "HelloWorld";
  }
  
  static func requiresMainQueueSetup () -> Bool {
    return true;
  }
  
  
  @objc
  func ShowMessage(_ message:NSString, duration:Double) -> Void {
    let alert = UIAlertController(title:nil, message: message as String, preferredStyle: .alert);
    let seconds:Double = duration;
    alert.view.backgroundColor = .black
    alert.view.alpha = 0.5
    alert.view.layer.cornerRadius = 14
    alert.view.backgroundColor = .yellow
    
    DispatchQueue.main.async {
      (UIApplication.shared.delegate as? AppDelegate)?.window.rootViewController?.present(alert, animated: true, completion: nil);
    }
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
      alert.dismiss(animated: true, completion: nil);
    })
  }
  
  
}
