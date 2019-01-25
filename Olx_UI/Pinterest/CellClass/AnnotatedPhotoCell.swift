//
//  asdad.swift
//  Pinterest
//
//  Created by Anand Suthar on 24/01/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
  
  @IBOutlet fileprivate weak var containerView: UIView!
  @IBOutlet fileprivate weak var imageView: UIImageView!
  @IBOutlet fileprivate weak var captionLabel: UILabel!
  @IBOutlet fileprivate weak var commentLabel: UILabel!
  
 // var photos = [#imageLiteral(resourceName: "images-4"),#imageLiteral(resourceName: "images-2"),#imageLiteral(resourceName: "images-3"),#imageLiteral(resourceName: "images"),#imageLiteral(resourceName: "images-5"),#imageLiteral(resourceName: "12"),#imageLiteral(resourceName: "05"),#imageLiteral(resourceName: "images-8"),#imageLiteral(resourceName: "images-8"),#imageLiteral(resourceName: "images-9"),#imageLiteral(resourceName: "05"),#imageLiteral(resourceName: "images-7"),#imageLiteral(resourceName: "images-5"),]
  var title = ["giuagud","giuagudfdgjdf","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuaguddtjytd",]
  var coomenttxt = ["giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud","giuagud",]
  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.layer.cornerRadius = 6
    containerView.layer.masksToBounds = true
  }
  
  var photo: Photo? {
    didSet {
      if let photo = photo {
        imageView.image = photo.image
        captionLabel.text = photo.caption
        commentLabel.text = photo.comment
      }
    }
  }
  
}
