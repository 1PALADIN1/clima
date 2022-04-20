//
//  ViewController.swift
//  Clima
//
//  Created by Ruslan Malinovsky on 19.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var tempertureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
    }
    
    @IBAction func getCurrentLocationPressed(_ sender: UIButton) {
    }
    
}
