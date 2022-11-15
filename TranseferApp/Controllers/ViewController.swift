//
//  ViewController.swift
//  TranseferApp
//
//  Created by Евгений Забродский on 9.11.22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Property
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var updateData: String = "Test data"
    
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(withText: updateData)
    }
    
    // MARK: - Methods 'n actions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toEditScreen" :
            prepareEditScreen(segue)
        default: break
        }
        
        if let str = sender as? String,
           let modalVC = segue.destination as? ModalViewController {
            modalVC.textLabelInfo = str
        }
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? SecondViewController else {
            return
        }
        destinationController.updatingData = dataLabel.text ?? ""
    }
    
    private func updateLabel(withText text: String) {
        dataLabel.text = updateData
    }
    
    @IBAction func goByXib(_ sender: Any) {
        let vc = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
        vc.dataString = "Hello from Scene A"
        vc.navigationItem.title = "Scene C"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func editDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        editScreen.updatingData = dataLabel.text ?? ""
        
        self.navigationController?.pushViewController(editScreen, animated: true)
    }
    
    
    @IBAction func goToModalVC() {
        performSegue(withIdentifier: "GoToModalVC", sender: "Scene C")
    }
    
    
    
    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {}
    

}

