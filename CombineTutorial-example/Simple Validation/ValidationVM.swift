//
//  ValidationVM.swift
//  CombineTutorial-example
//
//  Created by 김도훈 on 2023/07/27.
//

import Foundation
import Combine
import UIKit

class ValidationVM: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    //input
    @Published var userNameTextField: String = ""
    @Published var passwordTextField: String = ""
    
    
    
    
    
}
