//
//  LoginViewController.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 15/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic {}

class LoginViewController: UIViewController {
     
    @IBOutlet weak var btnStart: UIButton!
    
    var interactor: LoginBussinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.navigationController?.isNavigationBarHidden = true
        btnStart.flash()
    }
    
    @IBAction func startAction(_ sender: Any) {
        
        router?.goToList()
        
    }
}

extension LoginViewController: LoginDisplayLogic {}

private extension LoginViewController {

	func setup() {
        
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
}
