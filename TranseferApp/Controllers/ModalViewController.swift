//
//  ModalViewController.swift
//  TranseferApp
//
//  Created by Евгений Забродский on 10.11.22.
//

import UIKit

class ModalViewController: UIViewController {
    
    // MARK: - Property
    
    var textLabelInfo: String?
    
    @IBOutlet weak var labelModalVC: UILabel!
    
    // MARK: - Life cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelModalVC.text = textLabelInfo

    }
    
    // MARK: - Methods 'n actions

    @IBAction func returnButton() {
        dismiss(animated: true)
    }
    

}
