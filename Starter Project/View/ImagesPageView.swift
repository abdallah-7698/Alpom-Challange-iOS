//
//  ImagesPageView.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

class ImagesPageView: UIView {
    
    //MARK: - IBOutlet
    fileprivate var imagesCollectioView : UICollectionView!
    
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureCollectionView()
        imagesCollectioView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureCollectionView(){
        imagesCollectioView = UICollectionView(frame: frame, collectionViewLayout: setupCollectionViewLayout())
        imagesCollectioView.dataSource = self
        imagesCollectioView.delegate = self
        imagesCollectioView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        addSubview(imagesCollectioView)
    }
    
    fileprivate func setupCollectionViewLayout()->UICollectionViewLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: frame.size.width / 2, height: frame.size.width / 2)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
    
}

extension ImagesPageView : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}
