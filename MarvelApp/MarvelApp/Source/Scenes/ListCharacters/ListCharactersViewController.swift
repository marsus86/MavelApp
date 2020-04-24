//
//  ListCharactersViewController.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol ListCharactersDisplayLogic {
    func loadData(data: DataCharacter)
    func showError()
}

class ListCharactersViewController: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var titleSection: UILabel!
    @IBOutlet weak var tableViewCharacters: UITableView!
    
    let cellIdentifier = "CustomViewTableViewCell"
    
    var listCharacter:  DataCharacter?
    var nameCharactersView: ListCharacter?
    
    var url: String = ""
    var idCharacter: Int = 0

    var interactor: ListCharactersBussinessLogic?
    var router: (NSObjectProtocol & ListCharactersRoutingLogic & ListCharactersDataPassing)?
    
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
        setup()
        configView()
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.showLoading()
        interactor?.loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.handleSegue(segue)
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {

           // create the alert
           let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)

           // add an action (button)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

           // show the alert
           self.present(alert, animated: true, completion: nil)
       }
}

extension ListCharactersViewController: ListCharactersDisplayLogic {
    func loadData(data: DataCharacter) {
        
        listCharacter = data
        self.dismissLoading()
        self.tableViewCharacters.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "LO SENTIMOS", message: "No podemos mostrar la lista de personajes en este momento", preferredStyle: .alert)
       
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
             })
        
        ok.setValue(UIColor.init(red: 190.0, green: 0.0, blue: 0.0, alpha: 44.0), forKey: "titleTextColor")
        alert.addAction(ok)
            
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}

private extension ListCharactersViewController {

	func setup() {
        
        let viewController = self
        let interactor = ListCharactersInteractor()
        let presenter = ListCharactersPresenter()
        let router = ListCharactersRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func configView() {
    }
}

extension ListCharactersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let list = listCharacter?.results{
            return list.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomViewTableViewCell,
            
            let list = listCharacter?.results {
            idCharacter = list[indexPath.row].id!
            
            cell.bind(delegate: self, idCharacter: idCharacter)
            cell.labelCell.text = list[indexPath.row].name
            
            let urlString = (list[indexPath.row].thumbnail?.path)!+"."+(list[indexPath.row].thumbnail?.fileExtension!)!
            
            let url = URL(string: urlString)
            cell.imageCell.downloadImage(imgURL: url!)
    
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ListCharactersViewController: CustomViewTableViewCellDelegate {
    
    func showViewDetail(idCharacter: Int) {
     
        self.idCharacter = idCharacter
        router?.goToDetail()
    }
}

extension UIImageView {
    
    func downloadImage(imgURL: URL) {

        DispatchQueue.global().async { [weak self] in
        if let data = try? Data(contentsOf: imgURL), let image = UIImage(data: data) {

            DispatchQueue.main.async {
                self?.image = image
                }
            }
        }
    }
}

