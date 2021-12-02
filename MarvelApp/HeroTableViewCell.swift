//
//  HeroTableViewCell.swift
//  MarvelApp
//
//  Created by Juan Gallo on 1/12/21.
//

import UIKit
import WebKit

class HeroTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var webKit: WKWebView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func displayHeroCell (_ urls: Urls){
        let heroUrl = urls.url
        let url = URL(string: heroUrl!)
        guard url != nil else{
            return
        }
        let request = URLRequest(url: url!)
        webKit.load(request)
    }
    
}
