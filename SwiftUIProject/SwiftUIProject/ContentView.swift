//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by lee on 2019/11/1.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit
import SwiftUI
import RxSwift

let dispose = DisposeBag()

struct ContentView: View {
    var viewModel = LoginViewModel.init()
    @State var str = ""
    var body: some View {
        VStack{
            Text(str)
        }.onAppear {
            self.viewModel.Login().subscribe(onNext: { (loginModel) in
                print("\(loginModel)")
                self.str = loginModel.username!+">>>>"+loginModel.password!
            }).disposed(by: dispose)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
