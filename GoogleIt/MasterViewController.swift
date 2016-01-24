//
//  MasterViewController.swift
//  GoogleIt
//
//  Created by iMac 27 on 2016-01-15.
//  Copyright © 2016 iMac 27. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBAction func showMap(sender: UIButton) {
        switch sender.tag {
        case 0: url = Constants.AirportURL
        case 1: url = Constants.AmusementURL
        case 2: url = Constants.CarsURL
        case 3: url = Constants.ChurchURL
        case 4: url = Constants.FastFoodURL
        case 5: url = Constants.FootballURL
        case 6: url = Constants.GolfURL
        case 7: url = Constants.HockeyURL
        case 8: url = Constants.MallsURL
        case 9: url = Constants.ParkingURL
        case 10: url = Constants.RestaurantURL
        case 11: url = Constants.SchoolURL
        case 12: url = Constants.SoccerURL
        case 13: url = Constants.SportsFieldURL
        case 14: url = Constants.Seven11URL
        case 15: url = Constants.TennisURL
        case 16: url = Constants.UniversityURL
        default: break
        }
        openMap(nil)
    }
    @IBAction func changeDefaultLocation(sender: UIButton) {
        defaultLocation = nil
        let alert = UIAlertController(title: "Reset Location", message: "Default City to search", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: nil))
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Enter Location to Search:"
            textField.secureTextEntry = false
            self.textField = textField
        })
        presentViewController(alert, animated: true, completion: nil)
    }
    private struct Constants {
        static let AirportURL = "https://www.google.com/maps/search/airport"
        static let AmusementURL = "https://www.google.com/maps/search/amusement"
        static let CarsURL = "https://www.google.com/maps/search/car+rental"
        static let ChurchURL = "https://www.google.com/maps/search/church"
        static let FastFoodURL = "https://www.google.com/maps/search/fast+food+restaurant"
        static let FootballURL = "https://www.google.com/maps/search/football"
        static let GolfURL = "https://www.google.com/maps/search/golf"
        static let HockeyURL = "https://www.google.com/maps/search/hockey"
        static let MallsURL = "https://www.google.com/maps/search/mall"
        static let ParkingURL = "https://www.google.com/maps/search/parking"
        static let RestaurantURL = "https://www.google.com/maps/search/restaurant"
        static let SchoolURL = "https://www.google.com/maps/search/school"
        static let SoccerURL = "https://www.google.com/maps/search/soccer"
        static let SportsFieldURL = "https://www.google.com/maps/search/sports+field"
        static let Seven11URL = "https://www.google.com/maps/search/7+eleven"
        static let TennisURL = "https://www.google.com/maps/search/tennis"
        static let UniversityURL = "https://www.google.com/maps/search/University"
        static let MarketingURL = "https://redblockblog.wordpress.com/marketing/"
    }
    var url: String?
    var textField: UITextField?
    var defaultLocation: String?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        textField = UITextField()
//    }
    func replaceSpaces(text: String?) -> String {
        var city = ""
        if text != nil {
            for index in text!.characters.indices {
                if text![index] == " " {
                    city.append(Character("+"))
                } else {
                    city.append(text![index])
                }
            }
            return city
        }
        return ""
    }
    func openMap(sender: UIButton?) {
        if url != nil {
            if defaultLocation == nil {
                let locn = textField?.text
                defaultLocation = replaceSpaces(locn)
            }
            if defaultLocation != nil && !defaultLocation!.isEmpty {
                url = url! + "+" + defaultLocation!
            }
            if let nsurl = NSURL(string: url!) {
                UIApplication.sharedApplication().openURL(nsurl)
            }
        }
    }
}
