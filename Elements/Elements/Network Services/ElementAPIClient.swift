//
//  ElementAPIClient.swift
//  Elements
//
//  Created by Yaz Burrell on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
import UIKit

final class ElementAPIClient {
    static func getElements(completionHandler: @escaping (AppError?, [Element]?) -> Void) {
        let getElementEndpoint = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        NetworkHelper.shared.performDataTask(endpointURLString: getElementEndpoint, httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
                if let appError = appError {
                completionHandler(appError, nil)
                } else if let data = data {
                    do {
                    var elements = try JSONDecoder().decode([Element].self, from: data)
                    elements = elements.sorted { $0.name > $1.name }
                    completionHandler(nil, elements)
                    } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    
    
    
    static func postFavorite(data: Data, completionHandler: @escaping (AppError?, Bool) -> Void) {
        let publishFavorite = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        NetworkHelper.shared.performUploadTask(endpointURLString: publishFavorite, httpMethod: "POST", httpBody: data) {(appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, false)
            }
            guard let response = httpResponse, (200...299).contains(response.statusCode) else {
                let statusCode = httpResponse?.statusCode ?? -999
                completionHandler(AppError.badStatusCode(String(statusCode)), false)
                return
            }
            if let _ = data {
                completionHandler(nil, true)
            }
        }
        
    }
}
