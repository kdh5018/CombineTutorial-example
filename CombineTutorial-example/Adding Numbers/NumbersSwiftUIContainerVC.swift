//
//  NumbersSwiftUIContainerVC.swift
//  CombineTutorial-example
//
//  Created by 김도훈 on 2023/07/25.
//

import Foundation
import UIKit
import SwiftUI

class SwiftUIContainerVC<SwiftUIView: View> : UIViewController {
    
    let swiftUIVIew: SwiftUIView
    
    init(swiftUIVIew: SwiftUIView) {
        self.swiftUIVIew = swiftUIVIew
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.configureHostingVC()
    }
    fileprivate func configureHostingVC() {
        let hostingVC = UIHostingController(rootView: swiftUIVIew)
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(hostingVC)
        self.view.addSubview(hostingVC.view)
        hostingVC.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            hostingVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
}


class NumbersSwiftUIViewContainerVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.configureHostingVC()
    }
    fileprivate func configureHostingVC() {
        let hostingVC = UIHostingController(rootView: NumbersView())
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(hostingVC)
        self.view.addSubview(hostingVC.view)
        hostingVC.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            hostingVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
}

struct NumbersView: View {
    
    @StateObject var viewModel = NumbersVM()
    
    @State var input: String = ""
    
    var body: some View {
        VStack(alignment: .trailing) {
            
            TextField("", text: $viewModel.number1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("", text: $viewModel.number2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("", text: $viewModel.number3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
            
            Text($viewModel.resultValue.wrappedValue)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }

}

//struct MyView: View {
//
//    @State var input: String = ""
//
//    var body: some View {
//        VStack(alignment: .trailing) {
//
//            Text("My View")
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//        }
//        .padding(.horizontal, 100)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.purple)
//    }
//
//}

extension View {
    func getContainerVC() -> UIViewController {
        return SwiftUIContainerVC(swiftUIVIew: self)
    }
}

struct NumbersView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersView()
    }
}
