//
//  ThirdViewController.swift
//  TranseferApp
//
//  Created by Евгений Забродский on 14.11.22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: - Property
    
    var dataString: String?
    
    @IBOutlet weak var labelThirdVC: UILabel!
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelThirdVC.text = dataString

    }
    
    // MARK: - Methods 'n actions

    @IBAction func mainButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    

}
