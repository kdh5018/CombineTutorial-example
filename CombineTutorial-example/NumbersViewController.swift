//
//  NumbersViewController.swift
//  RxExample
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import UIKit
import Combine
import CombineCocoa

class NumbersViewController: UIViewController {
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!

    @IBOutlet weak var result: UILabel!
    
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Publishers
            .CombineLatest3(number1.textPublisher,
                            number2.textPublisher,
                            number3.textPublisher)
            .map { textValue1, textValue2, textValue3 -> Int in
                return textValue1.getNumber() + textValue2.getNumber() + textValue3.getNumber()
            }
            .map { "\($0)" }
            .assign(to: \.text, on: result)
//            .sink { value in
//                print(#fileID, #function, #line, "- value: \(value)")
//            }
            .store(in: &subscriptions)
        
        
        // rx 바인딩
//
//        Observable.combineLatest(number1.rx.text.orEmpty, number2.rx.text.orEmpty, number3.rx.text.orEmpty) { textValue1, textValue2, textValue3 -> Int in
//                return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
//            }
//            .map { $0.description }
//            .bind(to: result.rx.text)
//            .disposed(by: disposeBag)
        
    }
    

}

extension String? {
    
    func getNumber() -> Int {
        return Int(self ?? "0") ?? 0
    }
}

extension String {
    
    func getNumber() -> Int {
        return Int(self ?? "0") ?? 0
    }
}
