//
//  ElementDetailViewController.swift
//  Elements
//
//  Created by Yaz Burrell on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementDetailViewController: UIViewController {

    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var symbolDetails: UILabel!
    @IBOutlet weak var numberDetails: UILabel!
    @IBOutlet weak var weightDetails: UILabel!
    @IBOutlet weak var meltingPointDetails: UILabel!
    @IBOutlet weak var boilingPointDetails: UILabel!
    @IBOutlet weak var discoveryDetails: UILabel!
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    public var elements: Element!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateElementUI()
        title = elements.name
        
    }
    
    @IBAction func addToFavorites(_ sender: UIBarButtonItem){
        let favorite = Favorite.init(name: "Yaz", number: elements.number)
        do {
          var post = try JSONEncoder().encode(favorite)
        } catch {
            print("encoding error: \(error)")
        }
    }
    
    
    private func updateElementUI() {
        symbolDetails.text = elements?.name
        numberDetails.text = String(elements.number)
        
        let detailElements =  elements.name.lowercased()
        let largeImage = "http://images-of-elements.com/\(detailElements).jpg"
        ImageHelper.shared.fetchImage(urlString: largeImage) { (error, image) in
            if let error = error {
                print(error.errorMessage())
            } else if let _ = self.elementImage {
                DispatchQueue.main.async {
                    self.elementImage.reloadInputViews()
                }
            }
        
        }
        
    
    }

   
}


