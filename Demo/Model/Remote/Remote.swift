//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/16/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation
import Alamofire

let HOST = "http://192.168.199.245:8181"
let API_VERSION = "/api/v1"

enum API: String {
    case USER = "/users/"
    case ACCOUNT = "/account/"
}

let userArraySerializer = DecodableResponseSerializer<[User]>()

func accountReq(name: String, completionHandler: ((Any) -> Void)? = nil) -> Void {
    let url = HOST + API_VERSION + API.USER.rawValue + "?name=" + name
    AF.request(url).response(responseSerializer: userArraySerializer) { response in
        switch response.result {
        case .success(let data):
            completionHandler?(data)
        case .failure(let error):
            print("error:\(error)")
        }
    }
}

func httpPOST(api: API, param: [User], completionHandler: ((Any) -> Void)? = nil) -> Void {
    let url = HOST + API_VERSION + api.rawValue
    AF.request(url, method: .post, parameters: param, encoder: JSONParameterEncoder()).response(responseSerializer: userArraySerializer) { response in
        switch response.result {
        case .success(let data):
            completionHandler?(data)
        case .failure(let error):
            print("error:\(error)")
        }
    }
}

func httpGET(api: API, id: String?, completionHandler: ((Any) -> Void)? = nil) -> Void {
    let url = HOST + API_VERSION + api.rawValue + (id ?? "")
    AF.request(url).response(responseSerializer: userArraySerializer) { response in
        switch response.result {
        case .success(let data):
            completionHandler?(data)
        case .failure(let error):
            print("error:\(error)")
        }
    }
}

func httpPatch(api: API, param: [User], completionHandler: ((Any) -> Void)? = nil) -> Void {
    let url = HOST + API_VERSION + api.rawValue
    AF.request(url, method: .patch, parameters: param, encoder: JSONParameterEncoder()).response(responseSerializer: userArraySerializer) { response in
        switch response.result {
        case .success(let data):
            completionHandler?(data)
        case .failure(let error):
            print("error:\(error)")
        }
    }
}

func httpDelete(api: API, id: String, completionHandler: ((Any) -> Void)? = nil) -> Void {
    let url = HOST + API_VERSION + api.rawValue + id
    AF.request(url, method: .delete).response(responseSerializer: userArraySerializer) { response in
        switch response.result {
        case .success(let data):
            completionHandler?(data)
        case .failure(let error):
            print("error:\(error)")
        }
    }
}

//func encode<T>(_ para: T) -> Data where T : Encodable {
//    do {
//        let encoder = JSONEncoder()
//        return try encoder.encode(para)
//    } catch {
//        print(error)
//    }
//    return Data()
//}

//func decode<T>(_ type: T.Type, from: String, defaultValue: T) -> T where T : Decodable {
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(type.self, from: from.data(using: .utf8)!)
//        } catch {
//            print(error)
//        }
//    return defaultValue
//}

//DispatchQueue.main.asyncAfter(deadline: .now()) {}
//print(UIDevice.current.identifierForVendor!.uuidString)
