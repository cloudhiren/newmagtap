//
//  File.swift
//  
//
//  Created by Hiren on 18/03/24.
//

import Foundation
import Alamofire
import SwiftyJSON

class WordMeaningViewModel {
    
    func WordMeaningApi(text: String, completion:@escaping (WordMeaningModel?)->() ) {
        
        
        let headers: HTTPHeaders = [
            "accountId": "065622FD-3F31-469E-B549-5D778202AAF0",
            "token":  "WExNRx9LqZL02ydila/ljUin9eU6Espq4FqfJ5GqlzK5djxEK2bysILK84D9rU25jth2BNkjRxvDpWxdxyNCwtnXy7sl4/C6x+Ay1RAbVJ3AFj5O1ocl3v1E8uiGnfr9",
            "x-api-key":"yHlZ8y6Ggq7xBXVm7oInz5kQyhDHPK4tZma0eaS6",
            "language": "hindi",
        ]
        
        let urlString = "https://api.mtapp.in/word/v2/meaning?word=\(text)"
        let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        
       
        AF.request("\(encoded ?? "")", method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: WordMeaningModel.self) { response in
                switch response.result {
                case .success(let data) :
                    if response.data != nil {
                        print(data)
                        completion(data)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(nil)
                }
            }
    }
}
