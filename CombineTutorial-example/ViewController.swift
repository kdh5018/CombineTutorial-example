//
//  ViewController.swift
//  CombineTutorial-example
//
//  Created by 김도훈 on 2023/07/25.
//

import UIKit
import CombineCocoa
import Combine



class ViewController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()

    @IBOutlet weak var navToNumbersBtn: UIButton!
    
    @IBOutlet weak var navToNumbersSwiftUIButton: UIButton!
    
    @IBOutlet weak var navToValidationBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navToNumbersBtn
            .tapPublisher
            .sink(receiveValue: {
                print(#fileID, #function, #line, "- <#comment#>")
                
                //MARK: - Numbers로 화면 이동
                let numbersVC = NumbersViewController.instantiate("Numbers")
                self.navigationController?.pushViewController(numbersVC, animated: true)
            })
            .store(in: &subscriptions)
        
        navToValidationBtn
            .tapPublisher
            .sink(receiveValue: {
                print(#fileID, #function, #line, "- <#comment#>")
                
                //MARK: - Numbers로 화면 이동
                let validationVC = ValidationViewController.instantiate("Validation")
                self.navigationController?.pushViewController(validationVC, animated: true)
            })
            .store(in: &subscriptions)
        
        navToNumbersSwiftUIButton
            .tapPublisher
            .sink(receiveValue: {
                print(#fileID, #function, #line, "- <#comment#>")
                
                //MARK: - Numbers로 화면 이동 - SwiftUI
//                let numbersVC = NumbersSwiftUIViewContainerVC()
                
//                let numbersVC = SwiftUIContainerVC(swiftUIVIew: NumbersView())
                
//                let numbersVC = NumbersView.getContainerVC()
                
                let numbersVC = NumbersView().getContainerVC()
                
//                let myVC = MyView().getContainerVC()
                
                self.navigationController?.pushViewController(numbersVC, animated: true)
//                self.navigationController?.pushViewController(myVC, animated: true)
            })
            .store(in: &subscriptions)
    }
    
    
    


}

