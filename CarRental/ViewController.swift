//
//  ViewController.swift
//  CarRental
//
//  Created by Madiapps on 27/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: IconTextField!
    @IBOutlet weak var label2: IconTextField!
    @IBOutlet weak var label3: IconTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1.configure(title: "Title1")
        label2.configure(title: "Title2")
        label3.configure(title: "Title3")
    }


}

