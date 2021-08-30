//
//  FeedController.swift
//  InstagramFirestoreTutorial
//
//  Created by LeeJaeHyeok on 2021/08/29.
//

import UIKit

private let reusableIdentifier = "Cell"

class FeedController: UICollectionViewController {
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: Helpers
    func configureUI() {
        collectionView.backgroundColor = .white //view.backgroundColor가 아닌 UICollectionViewController이기 때문에 collectionView로 적어야 합니다
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reusableIdentifier)
    }
}

// MARK: UICollectionViewDataSource
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as! FeedCell
        return cell
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
