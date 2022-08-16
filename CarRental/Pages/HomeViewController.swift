//
//  HomeViewController.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit

class HomeViewController: VC{
    
    // List datas
    var brands = [Brand]()
    var cars = [Car]() {
        didSet {
            carsFiltered = cars
        }
    }
    var carsFiltered = [Car]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // View for animation
    @IBOutlet weak var TopContainer: UIView!
    @IBOutlet weak var collectionTitle: UILabel!
    @IBOutlet weak var tableViewTitle: UILabel!
    
    // Constraint for animation
    @IBOutlet var TopContainer_TConstr: NSLayoutConstraint!
    @IBOutlet var TopContainer_BConstr: NSLayoutConstraint!
    @IBOutlet var CollectionView_CYConstr: NSLayoutConstraint!
    @IBOutlet var CollectionView_HConstr: NSLayoutConstraint!
    @IBOutlet var TableView_TConstr: NSLayoutConstraint!
    
    // Local Variable
    var animateIsDone = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        removeAnimation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        loadBrandsList()
        loadCarList()
    }
    
    fileprivate func initView() {
        searchBar.searchTextField.backgroundColor = .clear
        self.dismissKeyboard()
    }
    
    func loadBrandsList() {
        guard let data = Brand.getAll() else { return }
        brands = data
        
        collectionView.register(BrandCollectionViewCell.nib(), forCellWithReuseIdentifier: BrandCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func loadCarList() {
        guard let data = Car.getAll() else {return }
        cars = data.shuffled()
        
        tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
    }
    
    // Remove Animation after view disappear
    fileprivate func removeAnimation() {
        if animateIsDone {
            tableViewTitle.isHidden = false
            collectionTitle.isHidden = false
            
            
            NSLayoutConstraint.deactivate([
                TopContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.0),
                TopContainer.heightAnchor.constraint(equalToConstant: 70.0),
                collectionView.topAnchor.constraint(equalTo: TopContainer.bottomAnchor, constant: 10),
                tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30)
            ])
            NSLayoutConstraint.activate([
                TopContainer_TConstr,
                TopContainer_BConstr,
                CollectionView_CYConstr,
                CollectionView_HConstr,
                TableView_TConstr,
            ])
            if CollectionView_HConstr.constant == 80 {
                
            } else {
                print(CollectionView_HConstr.constant)
            }
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            animateIsDone = false
        }
    }
    
    // Animate on focus on textfield or click on branch'view
    fileprivate func animateView() {
        if !animateIsDone {
            tableViewTitle.isHidden = true
            collectionTitle.isHidden = true
            
            NSLayoutConstraint.deactivate([
                TopContainer_BConstr,
                TopContainer_TConstr,
                CollectionView_CYConstr,
                TableView_TConstr
            ])
            NSLayoutConstraint.activate([
                TopContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.0),
                TopContainer.heightAnchor.constraint(equalToConstant: 70.0),
                collectionView.topAnchor.constraint(equalTo: TopContainer.bottomAnchor, constant: 10),
                tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30)
            ])
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
                self.TopContainer.backgroundColor = .clear
            }
            animateIsDone = true
        }
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = brands[indexPath.item]
        let cv = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath) as! BrandCollectionViewCell
        
        cv.configure(model: BrandViewModel(name: model.name, imageName: model.imageUrl))

//        switch indexPath.item {
//        case 1: cv.configure(imageName: "lambo.png")
//        case 2: cv.configure(imageName: "bmw.png")
//        case 3: cv.configure(imageName: "benz.png")
//        default:
//            cv.configure(imageName: "porshe.png")
//        }
        return cv
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        animateView()
        if let cell = collectionView.cellForItem(at: indexPath) as? BrandCollectionViewCell {
            cell.container.borderColor = UIColor(named: "primary")
        }
        carsFiltered = cars.filter({ $0.car_brand.lowercased().contains(brands[indexPath.item].name.lowercased())})
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? BrandCollectionViewCell {
            cell.container.borderColor = .systemGray5
        }

    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carsFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as! CarTableViewCell
        let car = carsFiltered[indexPath.row]
        
        cell.configure(model: CarViewModel(type: car.car_model, brand: car.car_brand, price: car.rent_prize, imageName: car.car_image))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CarDetailViewController") as? CarDetailViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
