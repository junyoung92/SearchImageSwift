//
//  ImageCollectionViewCell.swift
//  SearchImageSwift
//
//  Created by Kiljunyoung on 2018. 7. 23..
//  Copyright © 2018년 jy. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    func configureCell(_ data:ImageResult) {
        imageView.kf.setImage(with: URL(string: data.thumbnail!))
         imageView.clipsToBounds = true
    }
}
