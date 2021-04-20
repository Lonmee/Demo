//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/16/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

//import SwiftHTTP

let HOST = "http://192.168.199.245:8181"
let API_VERSION = "/api/v1"

enum API: String {
    case USER = "/users/"
    case ACCOUNT = "/account/"
}

func accountReq(name: String, completionHandler: ((Any) -> Void)? = nil) -> Void {
//    HTTP.GET(HOST + API_VERSION + API.USER.rawValue + "?name=" + name) { response in
//        if let err = response.error {
//            print("error: \(err.localizedDescription)")
//            return //also notify app of failure as needed
//        }
//        if let handler = completionHandler {
//            handler(decode([User].self, from: response.text!, defaultValue: []))
//        }
//    }
}

func httpGET(api: API, id: String?, completionHandler: ((Any) -> Void)? = nil) -> Void {
//    HTTP.GET(HOST + API_VERSION + api.rawValue + (id ?? "")) { response in
//        if let err = response.error {
//            print("error: \(err.localizedDescription)")
//            return //also notify app of failure as needed
//        }
//        if let handler = completionHandler {
//            handler(decode([User].self, from: response.text!, defaultValue: []))
//        }
//    }
}

func httpPOST(api: API, param: [User], completionHandler: ((Any) -> Void)? = nil) -> Void {
//    HTTP.POST(HOST + API_VERSION + api.rawValue, parameters: ["content": String(data: encode(param), encoding: .utf8)!]) { response in
//        if let err = response.error {
//            print("error: \(err.localizedDescription)")
//            return //also notify app of failure as needed
//        }
//        if let handler = completionHandler {
//            handler(decode([User].self, from: response.text!, defaultValue: []))
//        }
//    }
}

func httpPatch(api: API, param: [User], completionHandler: ((Any) -> Void)? = nil) -> Void {
//    HTTP.POST(HOST + API_VERSION + api.rawValue, parameters: ["content": String(data: encode(param), encoding: .utf8)!]) { response in
//        if let err = response.error {
//            print("error: \(err.localizedDescription)")
//            return //also notify app of failure as needed
//        }
//        if let handler = completionHandler {
//            handler(decode([User].self, from: response.text!, defaultValue: []))
//        }
//    }
}

func httpDelete(api: API, id: String, completionHandler: ((Any) -> Void)? = nil) -> Void {
//    HTTP.DELETE(HOST + API_VERSION + api.rawValue + id) { response in
//        if let err = response.error {
//            print("error: \(err.localizedDescription)")
//            return //also notify app of failure as needed
//        }
//        if let handler = completionHandler {
//            handler(decode([User].self, from: response.text!, defaultValue: []))
//        }
//    }
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

func decode<T>(_ type: T.Type, from: String, defaultValue: T) -> T where T : Decodable {
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(type.self, from: from.data(using: .utf8)!)
//    } catch {
//        print(error)
//    }
    return defaultValue
}

//DispatchQueue.main.asyncAfter(deadline: .now()) {}
//print(UIDevice.current.identifierForVendor!.uuidString)
