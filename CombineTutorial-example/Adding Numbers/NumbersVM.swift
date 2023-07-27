//
//  NumbersVC.swift
//  CombineTutorial-example
//
//  Created by 김도훈 on 2023/07/25.
//

import Foundation
import Combine
import UIKit

class NumbersVM: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    //input - 뷰모델로 들어오는 녀석
    @Published var number1: String = ""
    @Published var number2: String = ""
    @Published var number3: String = ""
    
    
    //output - 뷰모델에서 나가는 녀석
    @Published var resultValue: String = ""
    
    lazy var resultPublisher: AnyPublisher<String, Never> =
        Publishers.CombineLatest3($number1, $number2, $number3)
            .map { textValue1, textValue2, textValue3 -> Int in
                return textValue1.getNumber() + textValue2.getNumber() + textValue3.getNumber()
            }
            .map { "\($0)" }
            .eraseToAnyPublisher()
    
    
    init() {
        print(#fileID, #function, #line, "- <#comment#>")
        
        resultPublisher
            .assign(to: \.resultValue, on: self)
            .store(in: &subscriptions)
        
//        Publishers
//            .CombineLatest3($number1,
//                            $number2,
//                            $number3)
//            .map { textValue1, textValue2, textValue3 -> Int in
//                return textValue1.getNumber() + textValue2.getNumber() + textValue3.getNumber()
//            }
//            .map { "\($0)" }
//            .assign(to: \.resultValue, on: self)
////            .sink { value in
////                print(#fileID, #function, #line, "- value: \(value)")
////                self.resultValue = value
////            }
//            .store(in: &subscriptions)
        
    }
    
}
