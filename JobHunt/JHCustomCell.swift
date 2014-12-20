//
//  JHCustomCell.swift
//  JobHunt
//
//  Created by kei on 2014/12/20.
//  Copyright (c) 2014年 tm444. All rights reserved.
//

import UIKit

class JHCustomCell: UICollectionViewCell {
    @IBOutlet var title:UILabel!
    @IBOutlet var image:UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
}
