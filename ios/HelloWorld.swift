//
//  HelloWorld.swift
//  BridgeOne
//
//  Created by Francisco Perez on 07/09/22.
//  OOOOOK, ESTO FUNCIONA

import Foundation
import UIKit
import stpinteractorcore
import stpdomaincore
import stpremoterepositorycore
import Combine

@objc(HelloWorld) // Module Name

class HelloWorld : NSObject, RCTBridgeModule {
  
  private var subscriber: AnyCancellable?
  
  private lazy var tokenInteractor: STPTokenGatewayInteractor = {
    let interactor = STPTokenGatewayInteractor(bundle: .main)
    return interactor
  }()
  
  
  static func moduleName() -> String!{
    return "HelloWorld";
  }
  
  static func requiresMainQueueSetup () -> Bool {
    return true;
  }
  
  
  @objc
  func ShowMessage(_ message:NSString, duration:Double) -> Void {
    self.subscriber = self.tokenInteractor.getToken(tokenEntity: STPTokenRequestEntity(username: "empty", password: "123"))?
      .receive(on: DispatchQueue.main).sink(receiveCompletion: { response in
        switch response {
        case .failure(let error):
          dump(error)
        case .finished:
          break
        }
      }, receiveValue: { model in
        dump(model)
      })
    
  }
  
  @objc
  func callMainApi() -> Void {
    print("Holi")
  }
  
  
  
  
}
