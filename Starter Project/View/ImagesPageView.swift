//
//  ImagesPageView.swift
//  Starter Project
//
//  Created by Abdallah on 29/03/2023.
//

import UIKit

protocol ImagesPageViewProtocol : AnyObject {
    func showFullImageViewController(image : UIImage)
}

class ImagesPageView: UIView {
    
    //MARK: - IBOutlet
    fileprivate var imagesCollectioView : UICollectionView!
    
    weak var delegate : ImagesPageViewProtocol?
    
    var imagesURL : [String?] = [] {
        didSet{
            imagesCollectioView.reloadData()
        }
    }
    
    override init(frame : CGRect){
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Configure UI
    
    fileprivate func configureCollectionView(){
        imagesCollectioView = UICollectionView(frame: .zero, collectionViewLayout: setupCollectionViewLayout())
        imagesCollectioView.dataSource = self
        imagesCollectioView.delegate = self
        imagesCollectioView.register(UINib(nibName: ImageCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ImageCell.reuseIdentifier)
        addSubview(imagesCollectioView)
        setupCollectionViewConstraints()
    }
    
    // MARK:  layout and constraints
    
    fileprivate func setupCollectionViewLayout()->UICollectionViewLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: frame.size.width / 2 - 10, height: frame.size.width / 2 - 5)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return layout
    }
    
    fileprivate func setupCollectionViewConstraints() {
        imagesCollectioView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagesCollectioView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imagesCollectioView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagesCollectioView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagesCollectioView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}

extension ImagesPageView : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseIdentifier, for: indexPath) as! ImageCell
        cell.setImage(from: imagesURL[indexPath.row]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ImageCell {
            delegate?.showFullImageViewController(image : cell.imageView.image!)
        }
    }
    
}
