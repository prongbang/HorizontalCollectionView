//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Endtry on 18/3/2563 BE.
//  Copyright © 2563 Endtry. All rights reserved.
//

import UIKit

struct Wallpaper {
    var backgroundImage: UIImage
}

class ViewController: UIViewController {
    
    fileprivate let data = [
        Wallpaper(backgroundImage:  UIImage(imageLiteralResourceName: "1")),
        Wallpaper(backgroundImage:  UIImage(imageLiteralResourceName: "2")),
        Wallpaper(backgroundImage:  UIImage(imageLiteralResourceName: "3")),
        Wallpaper(backgroundImage:  UIImage(imageLiteralResourceName: "4")),
        Wallpaper(backgroundImage:  UIImage(imageLiteralResourceName: "5")),
        Wallpaper(backgroundImage:  UIImage(imageLiteralResourceName: "6")),
    ]
    
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        // Use for xib
        let nib = UINib(nibName: "WallpaperCollectionCell", bundle: nil)
        cv.register(nib, forCellWithReuseIdentifier: "WallpaperCollectionCell")
        
        // For programmaing
        cv.register(WallpaperCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // For xib
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WallpaperCollectionCell", for: indexPath) as! WallpaperCollectionCell
        
        // For programming
        // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WallpaperCell
        
        cell.data = self.data[indexPath.item]
        return cell
    }
}
