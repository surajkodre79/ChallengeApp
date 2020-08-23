//
//  NetworkManager.swift
//  ChallengeApp
//
//  Created by Suraj Kodre on 23/08/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetWorkManager {
    public static let sharedInstance = NetWorkManager()
    
    func fetchDataFromURL(url: URL?, closure: @escaping ([UserData]?,Bool)->()) {
        guard let url = url else { return }
        
        AF.request(url).responseDecodable(of: [UserData].self) { (response) in
            do {
                guard let userData = response.value else { throw JSONError.NoData }
                closure(userData, true)
            } catch let error as JSONError {
                print(error.rawValue)
                closure(nil,false)
            } catch let error as NSError {
                print("Error: \(error)")
                closure(nil,false)
            }
        }
    }
}
