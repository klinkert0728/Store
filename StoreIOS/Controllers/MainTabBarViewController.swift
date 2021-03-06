//
//  MainTabBarViewController.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/19/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit

class MainTabBarViewController: BaseTabBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }
    
    private func checkUser() {
        if !DKHUser.isLoggedIn {
            let signInNav = DKHNavigation.signInNavigationViewController()
            let signInVC  = signInNav.topViewController as!  SignInViewController
            signInVC.successClosure = { _ in
                self.dismiss(animated: true, completion: nil)
            }
            self.present(signInNav, animated: true, completion: nil)
        }
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
