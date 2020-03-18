//
//  WallpaperCollectionCell.swift
//  HorizontalCollectionView
//
//  Created by Endtry on 18/3/2563 BE.
//  Copyright © 2563 Endtry. All rights reserved.
//

import UIKit

@IBDesignable
class WallpaperCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var background: UIImageView!
    
    var data: Wallpaper? {
        didSet {
            guard let data = data else { return }
            background.image = data.backgroundImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.rounded()
    }
    
}

extension UIImageView {
    
    func rounded() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 12
    }
}
