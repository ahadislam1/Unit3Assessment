//
//  ElementDetailViewController.swift
//  Unit3Assessment
//
//  Created by Ahad Islam on 12/12/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ElementDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var meltingLabel: UILabel!
    @IBOutlet weak var boilingLabel: UILabel!
    @IBOutlet weak var discoveryLabel: UILabel!
    
    var element: Element!
    
    private var imageURL: String {
        "https://images-of-elements.com/\(element.name.lowercased()).jpg"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        symbolLabel.text = element.symbol
        numberLabel.text = "\(element.number)"
        massLabel.text = "\(element.atomicMass)"
        meltingLabel.text = element.melt != nil ? "\(element.melt!) K" : nil
        boilingLabel.text = element.boil != nil ? "\(element.boil!) K" : nil
        discoveryLabel.text = element.discoveredBy != nil ? element.discoveredBy : nil
        
        imageView.getImage(with: imageURL) { result in
            switch result {
            case .failure(let error):
                print("Error getting image: \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
