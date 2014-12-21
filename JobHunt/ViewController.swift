//
//  ViewController.swift
//  JobHunt
//
//  Created by takumi on 2014/12/20.
//  Copyright (c) 2014年 tm444. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController, UICollectionViewDataSource ,UICollectionViewDelegate {
    @IBOutlet var nouhauCollectionView:UICollectionView!
    
    enum genreType:Int{
        case Nouhau
        case Fasshion
        case Girls
        case Kaihuku
    }
    
    var articleArray = [JHArticle]();
    var guidesiteId:String = String();
    
    var type:genreType = genreType.Fasshion
    
//    var isForGirls :Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        JHHTTPConnecter.sharedInstance.requestGuidesideWithGuideId("1928")
//        self.nouhauCollectionView.registerClass(JHCustomCell.self, forCellWithReuseIdentifier: "cell")
        
//        getGuidesites("1928");
        getGuidesites(self.guidesiteId);
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func getGuidesites(guideId:String){
        
        var urlStr:URLStringConvertible = "http://api.allabout.co.jp/allabout/guidesite/latest/\(guideId)"
//        if self.isForGirls == true{
//            urlStr = "http://api.allabout.co.jp/allabout/guidesite/latest/\(guideId)/70"
//            println("forgirls")
//        }else{
//            
//        }
        
        Alamofire.request(.GET, urlStr)
            .responseJSON { (request, response, JSON, error) -> Void in
//                println(JSON)
                
                if let guidsitesInfo:Dictionary = JSON as? Dictionary<String,AnyObject>{
//                    println("YES")

//                    println(guidsitesInfo["data"]);
                    
                    if let datas:Array = guidsitesInfo["data"] as? Array<AnyObject>{
                        for data in datas{
                            
//                            println(data)
                            
                            var id:Int = data["article_id"] as Int
                            var id_str = String(id)
                        /*
                            
                            switch self.type{
                            case .Nouhau:
                                var title:NSString = data["article_title"] as NSString
                                var girl:String = String("女子")
                                var range:NSRange = title.rangeOfString(girl)
                                if range.location == NSNotFound{
                                    let article:JHArticle = JHArticle(articleId: id_str as String,
                                        articleTitle: data["article_title"] as String,
                                        articleAbstract: data["article_abstract"] as String,
                                        articleThumUrl: data["article_topimg"] as String)
                                    self.articleArray.append(article);
                                }
                                break
                                
                            case .Girls:
                                var title:NSString = data["article_title"] as NSString
                                var girl:String = String("女子")
                                var range:NSRange = title.rangeOfString(girl)
                                if range.location != NSNotFound{
                                    let article:JHArticle = JHArticle(articleId: id_str as String,
                                        articleTitle: data["article_title"] as String,
                                        articleAbstract: data["article_abstract"] as String,
                                        articleThumUrl: data["article_topimg"] as String)
                                    self.articleArray.append(article);
                                }
                                break
                                
                            case .Fasshion:
                                let article:JHArticle = JHArticle(articleId: id_str as String,
                                    articleTitle: data["article_title"] as String,
                                    articleAbstract: data["article_abstract"] as String,
                                    articleThumUrl: data["article_topimg"] as String)
                                self.articleArray.append(article);
                                break
                                
                            case .Kaihuku:
                                let article:JHArticle = JHArticle(articleId: id_str as String,
                                    articleTitle: data["article_title"] as String,
                                    articleAbstract: data["article_abstract"] as String,
                                    articleThumUrl: data["article_topimg"] as String)
                                self.articleArray.append(article);
                                break
                                
                            }
                            */
                            let article:JHArticle = JHArticle(articleId: id_str as String,
                                articleTitle: data["article_title"] as String,
                                articleAbstract: data["article_abstract"] as String,
                                articleThumUrl: data["article_topimg"] as String)
                            self.articleArray.append(article);
                            
                            

                            
//                            println("id \(article.articleId)")
//                            println("title \(article.articleTitle)")
//                            println("abstract \(article.articleAbstract)")
//                            println("thum \(article.articleThumUrl)")

                            
                            
//                            println(self.articleArray)

                            
                        }
                        self.nouhauCollectionView.reloadData()

                        
                    }
                    
                    
//                    println(self.articleArray)
                    
                }else{
                    println("NO")
                }
                
                
                
                
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: JHCustomCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as JHCustomCell
        
        if self.articleArray.isEmpty{
//            cell.title.text = String("TEST")
//            println("empty")
        }else{
//            println("notempty")
            var article:JHArticle = self.articleArray[indexPath.row]
            cell.title.text = article.articleTitle
            
            let url = NSURL(string:article.articleThumUrl);
            
            let req = NSURLRequest(URL:url!)
            
            NSURLConnection.sendAsynchronousRequest(req, queue:NSOperationQueue.mainQueue()){(res, data, err) in
                let image = UIImage(data:data)
                cell.image.image = image
                // 画像に対する処理 (UcellのUIImageViewに表示する等)
            }
           
//            println(article.articleTitle)

        }
//        if article as?
//        {
//        }else{
//            
//        }
        
       
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if self.articleArray.isEmpty{
            //            cell.title.text = String("TEST")
            println("empty")
        }else{
            println("notempty")
            var article:JHArticle = self.articleArray[indexPath.row]
            
            let storyboad = UIStoryboard(name: "Main", bundle: nil)


            var detailViewController:DetailViewController = storyboad.instantiateViewControllerWithIdentifier("DetailViewController") as DetailViewController
            
            detailViewController.articleId = article.articleId
                self.navigationController?.pushViewController(detailViewController, animated: true)
        }

        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articleArray.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


}

