//
//  ViewController.swift
//  ShowingImages
//
//  Created by Ecem Aleyna on 22.03.2020.
//  Copyright © 2020 Ecem Aleyna. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String](){
        didSet {
               pictures.sort { $0 < $1 }

           }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Nature"
        navigationController?.navigationBar.prefersLargeTitles = true
        
     let fm = FileManager.default
     let path = Bundle.main.resourcePath!
     let items = try! fm.contentsOfDirectory(atPath: path)

     for item in items {
        if item.hasPrefix("Nature") {
            
            pictures.append(item)
            
         }
     }

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let seperated = pictures[indexPath.row].components(separatedBy: ".")
        cell.textLabel?.text = seperated[0]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let vc =  storyboard?.instantiateViewController(withIdentifier: "Detail" ) as? DetailViewController {
            
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}



