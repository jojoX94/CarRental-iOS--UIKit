//
//  HomeViewController.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit

class HomeViewController: VC, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var Brands: [BrandViewModel] = [BrandViewModel(imageName: "lambo-removebg-preview 2.png"),BrandViewModel(imageName: "lambo-removebg-preview 2.png"),BrandViewModel(imageName: "lambo-removebg-preview 2.png"),BrandViewModel(imageName: "lambo-removebg-preview 2.png")]
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBrandsList()
        loadCarList()
    }
    
    func loadBrandsList() {
        collectionView.register(BrandCollectionViewCell.nib(), forCellWithReuseIdentifier: BrandCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func loadCarList() {
        tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let model = Brands[indexPath.item]
        let cv = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath) as! BrandCollectionViewCell
        switch indexPath.item {
        case 1: cv.configure(imageName: "lambo.png")
        case 2: cv.configure(imageName: "bmw.png")
        case 3: cv.configure(imageName: "benz.png")
        default:
            cv.configure(imageName: "porshe.png")
        }
//        cv.configure(imageName: model.imageName)
        return cv
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as! CarTableViewCell
        cell.priceLabel.text = "$14.45"
        cell.typeLabel.text = "X7"
        cell.brandLabel.text = "BMW"
        cell.img.image = UIImage(named: "q7.png")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260.0
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
