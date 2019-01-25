//
//  asdad.swift
//  Pinterest
//
//  Created by Anand Suthar on 24/01/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoViewController: UICollectionViewController {
  
  var photos = Photo.allPhotos()
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    if let patternImage = UIImage(named: "Pattern") {
      view.backgroundColor = UIColor(patternImage: patternImage)
    }
    collectionView?.backgroundColor = UIColor.clear
    collectionView?.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
  
    if let layout = collectionView?.collectionViewLayout as? Layout {
      layout.delegate = self
    }
  }
  
}

extension PhotoViewController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath)
    if let annotateCell = cell as? AnnotatedPhotoCell {
      annotateCell.photo = photos[indexPath.item]
    }
    return cell
  }
  
}


extension PhotoViewController : CollectionVLayoutDelegate {
  

  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    return photos[indexPath.item].image.size.height
  }

}
