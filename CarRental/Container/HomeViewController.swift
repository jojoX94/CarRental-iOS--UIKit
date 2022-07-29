//
//  HomeViewController.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit

class HomeViewController: VC, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var Brands: [BrandViewModel] = [BrandViewModel(imageName: "lambo-removebg-preview 2.png"),BrandViewModel(imageName: "lambo-removebg-preview 2.png"),BrandViewModel(imageName: "lambo-removebg-preview 2.png"),BrandViewModel(imageName: "lambo-removebg-preview 2.png")]
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBrandsList()
    }
    
    func loadBrandsList() {
        collectionView.register(BrandCollectionViewCell.nib(), forCellWithReuseIdentifier: BrandCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = Brands[indexPath.item]
        let cv = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath) as! BrandCollectionViewCell
        cv.configure(imageName: "lambo.png")
//        cv.configure(imageName: model.imageName)
        return cv
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
