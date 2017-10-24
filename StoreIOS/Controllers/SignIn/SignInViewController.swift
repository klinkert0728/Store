//
//  SignInViewController.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/23/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignInViewController: BaseViewController {
    
    var successClosure:((_ user:DKHUser)->())!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        DKHUser.login(email: "oscarg798@gmail.com", password: "worker", successClosure: successClosure, errorClosure: {error in
            
            SVProgressHUD.showInfo(withStatus: error)
        })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
