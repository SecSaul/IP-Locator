//
//  SecondViewController.swift
//  IP Locator
//
//  Created by Saular Raffi on 5/9/19.
//  Copyright © 2019 SaularRaffi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController {
    
    @IBOutlet weak var countryView: UILabel!
    @IBOutlet weak var regionView: UILabel!
    @IBOutlet weak var cityView: UILabel!
    
    let API_Access_Key = "49a7ff24daebabcf46cd2d9d381e4ddb"
    let Base_URL = "http://api.ipstack.com/"
    let querry = "?access_key="
    var ip_address : String = ""
    
    var country : String = ""
    var region : String = ""
    var city : String = ""
    var latitude : Double = 0
    var longitude : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findIPAddressLocation(ip: ip_address)
    }
    
    func findIPAddressLocation(ip: String)
    {
        let myURL = URL(string: Base_URL+ip+querry+API_Access_Key)

        Alamofire.request(myURL!).responseJSON { response in
            if let jsonString = response.result.value {
                let json = JSON(jsonString)
                print(json)
                
                self.countryView.text = json["country_name"].stringValue
                self.regionView.text = json["region_name"].stringValue
                self.cityView.text = json["city"].stringValue
                
                if json["latitude"].double! != nil {
                    self.latitude = json["latitude"].double!
                    self.longitude = json["longitude"].double!
                }
            }
            else {
                print(response.error!)
            }
        }
    }
    
    @IBAction func goToMap(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMapViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMapViewController" {
            let destinationVC = segue.destination as! MapViewController
            destinationVC.lat = latitude
            destinationVC.long = longitude
        }
    }
    
}
