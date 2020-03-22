//
//  DetailViewController.swift
//  ShowingImages
//
//  Created by Ecem Aleyna on 22.03.2020.
//  Copyright © 2020 Ecem Aleyna. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage : String?
    var selectedPictureNumber : Int?
    var totalPictures : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let number = selectedPictureNumber, let total = totalPictures{
            title = "Picture \(number) of \(total)"
        } else {
           title = selectedImage
        }
        
        
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
   }
}

