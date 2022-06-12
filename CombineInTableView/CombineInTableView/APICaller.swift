//
//  GetApi.swift
//  CombineInTableView
//
//  Created by nick on 2022/6/5.
//

import Foundation
import Combine
class APICaller{
    static let shared = APICaller()
    func fetchData() -> Future<[String], Error>{
           return Future.init { promixe in
               DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    promixe(.success(["apple","google","sony","fb"]))
            }
        }
    }
}
