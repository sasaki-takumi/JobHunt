//
//  JHHTTPConnecter.swift
//  JobHunt
//
//  Created by kei on 2014/12/20.
//  Copyright (c) 2014年 tm444. All rights reserved.
//

import UIKit
import Alamofire

let _SingltonSharedInstance = JHHTTPConnecter();

class JHHTTPConnecter: NSObject {
    
    
    class var sharedInstance :JHHTTPConnecter {
        return _SingltonSharedInstance
    }
    
   
//    func requestGuidesideWithGuideId(guideId:NSString) ->NSDictionary{
//        var guide :NSDictionary = NSDictionary();
//        
//        var urlStr:URLStringConvertible = "http://api.allabout.co.jp/allabout/guidesite/latest/\(guideId)"
//        
//        Alamofire.request(.GET, urlStr)
//                .responseJSON { (request, response, JSON, error) -> Void in
//                    println(JSON)
//                    
//        }
//        
//        return guide;
//    }
    
}
