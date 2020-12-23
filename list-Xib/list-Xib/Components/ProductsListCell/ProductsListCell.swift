//
//  ProductsListCell.swift
//  table-Xib
//
//  Created by Ivo Dutra on 23/12/20.
//

import UIKit.UITableViewCell

class ProductsListCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Set up
    
    func setup(with product: Product) {
        titleLabel.text = product.product
        volumeLabel.text = product.description
        imgView.from(url: product.image)
        priceLabel.text = product.price.localized
        priceLabel.textColor = product.discount ? .systemGreen : .black
    }
    
    // MARK: - Initiate from nib
    
    class func instanceFromNib() -> ProductsListCell {
        return UINib(nibName: "ProductsListCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ProductsListCell
    }
    
}

