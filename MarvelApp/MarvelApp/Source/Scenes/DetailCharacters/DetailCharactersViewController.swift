//
//  DetailCharactersViewController.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol DetailCharactersDisplayLogic {
    func loadDataCharacter(data: ListCharacter)
    func showError()
}

class DetailCharactersViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var lbTitleList: UILabel!
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lbTitleNameCharacter: UILabel!
    
    var cellIdentifier = "DetailViewTableViewCell"
    
    var dataCharacter: ListCharacter?
    
    var interactor: DetailCharactersBussinessLogic?
    var router: (NSObjectProtocol & DetailCharactersRoutingLogic & DetailCharactersDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
          
          super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
          setup()
      }
      
      required init?(coder aDecoder: NSCoder) {
          
          super.init(coder: aDecoder)
          setup()
      }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        interactor?.getDataCharacter()
    }
    
    override func viewWillAppear(_ animated: Bool){
    }
    
    @IBAction func goToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailCharactersViewController: DetailCharactersDisplayLogic {
    
    func loadDataCharacter(data: ListCharacter) {
        
        self.dataCharacter = data
        
        self.lbTitleNameCharacter.text = "Personaje \(String((dataCharacter?.name!)!))"
        
        self.lbTitleList.text = "Historias en las que aparece"
        lbTitleList.layer.borderColor = UIColor.black.cgColor
        lbTitleList.layer.borderWidth = 1.5
        lbTitleList.layer.cornerRadius = 5
        lbTitleList.backgroundColor = UIColor(red: 252/255, green: 124/255, blue: 97/255, alpha: 1.0)
        
        let urlString = (dataCharacter?.thumbnail?.path)!+"."+(dataCharacter?.thumbnail?.fileExtension)!
        let url = URL(string: urlString)
        self.imageCharacter.downloadImage(imgURL: url!)
        self.tableList.reloadData()
    }
    
    func showError() {

        let alert = UIAlertController(title: "LO SENTIMOS", message: "No podemos mostrar el detalle del personaje seleccionado en este momento", preferredStyle: .alert)
        
         let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
              })
         
         ok.setValue(UIColor.init(red: 190.0, green: 0.0, blue: 0.0, alpha: 44.0), forKey: "titleTextColor")
         alert.addAction(ok)
             
         DispatchQueue.main.async(execute: {
             self.present(alert, animated: true)
         })
    }
}

private extension DetailCharactersViewController {

	func setup() {
        
        let viewController = self
        let interactor = DetailCharactersInteractor()
        let presenter = DetailCharactersPresenter()
        let router = DetailCharactersRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension DetailCharactersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let s = dataCharacter?.series {
            return s.items.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? DetailViewTableViewCell,

            let s = dataCharacter?.series {
            cell.lbStory.text = s.items[indexPath.row].name
            return cell
       }
        return UITableViewCell()
    }
}

extension UIImageView {
    
    func downloadImageCharacter(imgURL: URL) {

        DispatchQueue.global().async { [weak self] in
        if let data = try? Data(contentsOf: imgURL), let image = UIImage(data: data) {

            DispatchQueue.main.async {
                self?.image = image
                }
            }
        }
    }
}

