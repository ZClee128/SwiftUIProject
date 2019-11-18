//
//  LoginViewModel.swift
//  SwiftUIProject
//
//  Created by zclee on 2019/11/17.
//  Copyright © 2019 lee. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxMoya

class LoginViewModel: NSObject {
    
    func Login() -> Observable<loginModel> {
        return ApiProvider.rx.request(.login).filterSuccessfulStatusCodes().asObservable().mapObject(type: loginModel.self)
    }
}
