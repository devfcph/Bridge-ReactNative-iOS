//
//  CallApi.swift
//  BridgeOne
//
//  Created by Francisco Perez on 08/09/22.
//

import UIKit
import Foundation
import Combine
// API CONFIG
import ghmjolnircore
import stpsdkcore
import stponboardingapi


@objc(CallApi) // Module Name

class CallApi : /* RCTViewManager, */ UIViewController, RCTBridgeModule  {
  
  internal var controllerManager: GHManagerController?
  internal lazy var navigationApiController = UINavigationController()
  private var rootViewController: UIViewController?
  
  static func moduleName() -> String!{
    return "CallApi";
  }
  
  static func requiresMainQueueSetup () -> Bool {
    return true;
  }
  
  
  @objc
  func callApi() -> Void {
    
    DispatchQueue.main.async {
      print("Hello, I'm a api call ")
      
      self.setManagerConfig()
      
      self.controllerManager = GHManagerController(navBar: self.navigationApiController)
      
      if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
        //var para guardar el controlador que estaba antes del ViewController
        
        self.rootViewController = appDelegate.window.rootViewController
        
        
        appDelegate.window.rootViewController = self.navigationApiController
        appDelegate.window.makeKeyAndVisible()
        // API CONFIG
        self.controllerManager?.presentNavigationViewController(
          //Parámtetro para el flujo
          // Implementar NSLog
          managerModel: try! STPApiFlow.onboarding.modelManager
          //managerModel: try! STPApiFlow.
        )
      }
    }
    
  }
  
  @objc
  func closesSDK() {
    DispatchQueue.main.async {
      //Liberar
      
      if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
        appDelegate.window.rootViewController = self.rootViewController
        appDelegate.window.makeKeyAndVisible()
        
      }
    }
  }
  
  private func setManagerConfig() {
    STPSdkApiManager.shared
      .registerApi(managerModelList: STPOnboardingRegisterApi.flows)
      .build()
  }
  
}
