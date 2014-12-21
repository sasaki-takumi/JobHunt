//
//  DetailViewController.swift
//  JobHunt
//
//  Created by kei on 2014/12/21.
//  Copyright (c) 2014年 tm444. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    var articleId:String = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blueColor()
        
        self.getArticle(self.articleId)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getArticle(article_id:String){
        
        println(article_id)
        
        var urlStr:URLStringConvertible = "http://api.allabout.co.jp/allabout/article/contents/\(article_id)/1"
        
        Alamofire.request(.GET, urlStr)
            .responseJSON { (request, response, JSON, error) -> Void in
                
//                println(JSON)
                
                if let articleInfo:Dictionary = JSON as? Dictionary<String,AnyObject>{
//                    println( articleInfo["data"])
                    
                    if let datas:Array = articleInfo["data"] as? Array<AnyObject>{
                        
                        
                        
                        
                        for data in datas{
//                            println("daatataa")
                            
                            //                            println(data)
                            
//                            var id:Int = data["article_id"] as Int
//                            var id_str = String(id)
//                            
//                            
//                            let article:JHArticle = JHArticle(articleId: id_str as String,
//                                articleTitle: data["article_title"] as String,
//                                articleAbstract: data["article_abstract"] as String,
//                                articleThumUrl: data["article_topimg"] as String)
                        }
                    }
                }else{
                    println("NO")
                }
                
                
                
                
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
