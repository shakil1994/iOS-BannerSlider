//
//  ViewController.swift
//  ImageSlider
//
//  Created by DhakaLive on 12/3/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var sliderImageCollection: UICollectionView!
    @IBOutlet weak var sliderPageController: UIPageControl!
    
    
    let sliderImage: [UIImage] = [
        UIImage(named: "hall1")!,
        UIImage(named: "hall2")!,
        UIImage(named: "hall3")!,
        UIImage(named: "hall4")!,
        UIImage(named: "hall5")!,
        UIImage(named: "hall6")!
    ]
    
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sliderImageCollection.delegate = self
        sliderImageCollection.dataSource = self
        
        sliderPageController.numberOfPages = sliderImage.count
        sliderPageController.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func changeImage() {
    
    if counter < sliderImage.count {
        let index = IndexPath.init(item: counter, section: 0)
        self.sliderImageCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        sliderPageController.currentPage = counter
        counter += 1
    } else {
        counter = 0
        let index = IndexPath.init(item: counter, section: 0)
        self.sliderImageCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        sliderPageController.currentPage = counter
        counter = 1
    }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = sliderImage[indexPath.row]
        }
//        else if let ab = cell.viewWithTag(222) as? UIPageControl {
//            ab.currentPage = indexPath.item
//        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderImageCollection.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

