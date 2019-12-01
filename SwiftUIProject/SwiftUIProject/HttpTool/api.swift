//
//  api.swift
//  SwiftUIProject
//
//  Created by zclee on 2019/11/17.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation
import Moya


let ApiProvider = MoyaProvider<APi>(plugins: [RequestLoadingPlugin()])

enum APi {
    case login;
    case changepassword;
}




extension APi : TargetType {
    var baseURL: URL {
        return URL.init(string: "http://127.0.0.1:8080")!
    }

    var path: String {
        switch self {
        case .login:
            return "/Login"
        case .changepassword:
            return "/ChangePsd"
        default: break

        }
    }


    var method: Moya.Method {
        return .post
    }

    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }

    var task: Task {
        let apiTask = ApiTask()
        switch self {
        case .login:
            return apiTask.login(username: "聪哥",password: "123456")
        case .changepassword:
            return apiTask.changePsd(oldPsd: "123456", newPsd: "111111")
        default:
            break
        }

    }

    var headers: [String : String]? {
        let header = ["Content-Type" : "application/json; charset=utf-8;text/json;text/javascript;text/html;text/plain;text/html;"]
        return header
    }


}
