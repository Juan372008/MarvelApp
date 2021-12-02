//
//  ViewController.swift
//  MarvelApp
//
//  Created by Juan Gallo on 18/11/2020.
//

import UIKit
import WebKit

class ViewController: UIViewController,  HeroModelProtocol  {
    
    
    
    
    var model = HeroModel()
    var heroes:Data?
    var urls = [Urls]()

    @IBOutlet weak var tableView: UITableView!
    
    func heroesRetrieved(_ heroes: Data) {
        self.heroes = heroes
        self.urls = (heroes.data?.results?.first?.urls)!

        tableView.reloadData()
       
    }
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get heros from hero model
        
        tableView.delegate = self
        tableView.dataSource = self

        model.delegateHero = self
        model.getHeroes()
        
        
    }
    
    
    
   

}
 
extension ViewController: UITableViewDelegate,  UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell",for: indexPath) as! HeroTableViewCell
        let heroWeb = urls[indexPath.row]
        cell.displayHeroCell(heroWeb)
        return cell
    }
    
}

