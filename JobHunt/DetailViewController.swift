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
    
    @IBOutlet var abstractView:UITextView!
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var image:UIImageView!
    @IBOutlet var contentView:UITextView!
    @IBOutlet var scrollView:UIScrollView!
    
    var articleId:String = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        
        self.getArticle(self.articleId)
        
        
        
        
        // Do any additional setup after loading the view.
    }

     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getArticle(article_id:String){
        
        println(article_id)
        
        var urlStr:URLStringConvertible = "http://api.allabout.co.jp/allabout/article/contents/\(article_id)"
        
        Alamofire.request(.GET, urlStr)
            .responseJSON { (request, response, JSON, error) -> Void in
                
//                println(JSON)
                
                if let articleInfo:Dictionary = JSON as? Dictionary<String,AnyObject>{
                    
                    if let datas:Array = articleInfo["data"] as? Array<AnyObject>{
                        
//                        println(datas)
                        
                        if let dic:Dictionary = datas[0] as? Dictionary<String,AnyObject>{
                            
                            var abstract:String = dic["article_abstract"] as String
                            var title:String = dic["article_title"] as String
//
                            var contentHtml:String = dic["content"] as String
                            
                            
                            var topimg:String = dic["article_topimg"] as String
                            
//                            println(contentHtml)
                            
                            var reg:NSRegularExpression = NSRegularExpression()
                            
                            
                            self.abstractView.text = abstract
                            self.titleLabel.text = title
                            
                            var error:NSError?
                            
                            self.contentView.attributedText = NSAttributedString(
                                data: contentHtml.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                                options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType],
                                documentAttributes: nil,
                                error: &error)
                            
                            var newFrame:CGRect = self.contentView.frame
                            var str:NSString = self.contentView.text as NSString
                            var size1:CGSize = str.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(30.0)])
                            
                            newFrame.size.height = size1.height
                            
                            self.contentView.frame = newFrame

                            
                            self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 550+size1.height)
                            
                            println(size1.height)
                            
                            
                            let url = NSURL(string:topimg);
                            
                            let req = NSURLRequest(URL:url!)
                            
                            NSURLConnection.sendAsynchronousRequest(req, queue:NSOperationQueue.mainQueue()){(res, data, err) in
                                let image = UIImage(data:data)
                                self.image.image = image
                                // 画像に対する処理 (UcellのUIImageViewに表示する等)
                            }
                            
                        }

                        
                        
                        
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
