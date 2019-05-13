//
//  ViewController.swift
//  IP Locator
//
//  Created by Saular Raffi on 5/7/19.
//  Copyright © 2019 SaularRaffi. All rights reserved.
//

// https://ipstack.com/documentation
// https://ipstack.com/quickstart

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IP_Address: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSecondViewController", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondViewController" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.ip_address = IP_Address.text!
        }
    }
}


