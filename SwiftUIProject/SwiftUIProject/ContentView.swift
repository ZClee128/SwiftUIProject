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
import Combine

let dispose = DisposeBag()

struct ContentView: View {
    var viewModel = LoginViewModel.init()
    
    var body: some View {
        VStack{
            Text("data")
        }.onAppear {
            self.viewModel.Login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
