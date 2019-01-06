import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let imageNames = ["bear_first", "heart_second", "leaf_third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        // to snap each cell as a page per swipe
        collectionView.isPagingEnabled = true
    }
    
    // set minimum line spacing for each cell to remove default side spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // create # of items in collection view
        return imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create cell for each index
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let imageName = imageNames[indexPath.item]
        cell.bearImageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // set each collection view cell's size
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

