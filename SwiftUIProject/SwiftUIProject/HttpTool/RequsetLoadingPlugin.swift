//
//  RequsetLoadingPlugin.swift
//  SwiftUIProject
//
//  Created by zclee on 2019/11/17.
//  Copyright © 2019 lee. All rights reserved.
//

import Foundation
import Moya
import Result
import ObjectMapper
import RxSwift



class RequestLoadingPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var myRequest = request
        myRequest.timeoutInterval = 20
        return myRequest
    }
    
    func willSend(_ request: RequestType, target: TargetType) {
        print("开始请求-----\(request)")
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        print("结束请求----\(target)")
        switch result {
        case .success(let reponse):
            print(String(data: reponse.data, encoding: .utf8)!)
            break
        case .failure(_):
            break
        }
    }
}

extension Observable {
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return self.map { response in
            guard let dict = response as? [String: Any] else {
                throw RxSwiftMoyaError.ParseJosonError
            }
            
            return Mapper<T>().map(JSON: dict["data"] as! [String: Any])!
        }
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            guard let array = response as? [Any] else {
                throw RxSwiftMoyaError.ParseJosonError
            }
            
            guard let dicts = array as? [String: Any] else {
                throw RxSwiftMoyaError.ParseJosonError
            }
            
            return Mapper<T>().mapArray(JSONArray: [dicts])
        }
    }
    
    func parseServerError() -> Observable {
        return self.map { (response) in
            let name = type(of: response)
            print(name)
            guard let dict = response as? [String: Any] else {
                throw RxSwiftMoyaError.ParseJosonError
            }
            if let error = self.parseError(response: dict) {
                throw error
            }
            return self as! Element
        }
    }
    
    fileprivate func parseError(response: [String: Any]?) -> NSError? {
        var error: NSError?
        if let value = response {
            var code:Int?
            var msg:String?
            if let errorDic = value["error"] as? [String:Any]{
                code = errorDic["code"] as? Int
                msg = errorDic["msg"] as? String
                error = NSError(domain: "Network", code: code!, userInfo: [NSLocalizedDescriptionKey: msg ?? ""])
            }
        }
        return error
    }
}


enum RxSwiftMoyaError: String {
    case ParseJosonError
    case OtherError
}

extension RxSwiftMoyaError : Swift.Error{}
