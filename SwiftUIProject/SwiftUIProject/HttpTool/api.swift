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
}


extension APi : TargetType {
    var baseURL: URL {
        return URL.init(string: "http://127.0.0.1:8080")!
    }

    var path: String {
        switch self {
        case .login:
            return "/Login"
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
        default:
            break
        }

    }

    var headers: [String : String]? {
        let header = ["Content-Type" : "application/json; charset=utf-8;text/json;text/javascript;text/html;text/plain;text/html;"]
        return header
    }


}
