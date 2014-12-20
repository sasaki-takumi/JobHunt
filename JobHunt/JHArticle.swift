//
//  JHArticle.swift
//  JobHunt
//
//  Created by kei on 2014/12/20.
//  Copyright (c) 2014年 tm444. All rights reserved.
//

import UIKit

class JHArticle: NSObject {
    
    var articleId:String, articleTitle:String,articleAbstract:String, articleThumUrl:String
    
    init(articleId:String, articleTitle:String, articleAbstract:String, articleThumUrl:String){
        self.articleId = articleId
        self.articleTitle = articleTitle
        self.articleAbstract = articleAbstract
        self.articleThumUrl = articleThumUrl
    }
   
}
