import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//    let imageNames = ["bear_first", "heart_second", "leaf_third"]
//    let headerStrings = ["Join us today in our fun and games!", "Subscribe and get coupons on our daily events", "VIP members special services"]

    let pages = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and games!"),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events"),
        Page(imageName: "leaf_third", headerText: "VIP members special services")
    ]
    
    
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
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create cell for each index
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell // cast cell to be PageCell class type to access props
        
        let page = pages[indexPath.item]
        cell.bearImageView.image = UIImage(named: page.imageName)
        cell.descriptionTextView.text = page.headerText
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // set each collection view cell's size
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

