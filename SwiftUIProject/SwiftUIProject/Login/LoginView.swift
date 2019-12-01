//
//  LoginView.swift
//  SwiftUIProject
//
//  Created by zclee on 2019/12/1.
//  Copyright © 2019 lee. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var phone = ""
    var body: some View {
        VStack {
            TextField("手机号", text: $phone)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
