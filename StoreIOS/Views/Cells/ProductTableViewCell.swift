//
//  ProductTableViewCell.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/19/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureProduct(product:DKHProduct) {
        
        productName.text            = product.name
        productDescription.text     = product.productDescription
        productPrice.text           = "$" + product.price
        
        guard let firstImage = product.images.first?.value, let productUrl = URL(string:firstImage) else {
            return
        }
        
        productImage.af_setImage(withURL:productUrl , placeholderImage: UIImage(named:"a"))
        
    }
    
}
