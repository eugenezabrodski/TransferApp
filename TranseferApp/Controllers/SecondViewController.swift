//
//  SecondViewController.swift
//  TranseferApp
//
//  Created by Евгений Забродский on 9.11.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Property
    
    var updatingData: String = ""

    @IBOutlet weak var dataTextField: UITextField!
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    // MARK: - Methods
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
        
    }
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
        self.navigationController?.viewControllers.forEach {
            viewController in (viewController as? ViewController)?.updateData = dataTextField.text ?? ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toFirstScreen" :
            prepareFirstScreen(segue)
        default: break
        }
    }
    
    private func prepareFirstScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? ViewController else {
            return
        }
        destinationController.updateData = dataTextField.text ?? ""
    }
    
    

 

}
