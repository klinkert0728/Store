//
//  SelectCategoryTableViewController.swift
//  StoreIOS
//
//  Created by Daniel Klinkert Houfer on 10/18/17.
//  Copyright © 2017 Daniel Klinkert Houfer. All rights reserved.
//

import UIKit
import SVProgressHUD

class SelectCategoryTableViewController: BaseTableViewController {

    var storeCategories = [DKHCategory]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func registerCells() {
        super.registerCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkUser()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storeCategories.count
    }

    private func getCategories() {
        SVProgressHUD.show()
        DKHAPIClient.sharedClient.requestArrayOfObject(endpoint: DKHEndPoint.getCategories(), completionHandler: { (categories:[DKHCategory]) in
            self.storeCategories = categories
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }, errorClosure: {error in
            SVProgressHUD.dismiss()
        })
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text    = storeCategories[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = storeCategories[indexPath.row]
        
        let selectProductsVc = DKHNavigation.selectStoreProducts()
        selectProductsVc.selectedCategory = selectedCategory.uuid
        self.navigationController?.pushViewController(selectProductsVc, animated: true)
    }
    
    private func checkUser() {
        if !DKHUser.isLoggedIn {
            let signInNav = DKHNavigation.signInNavigationViewController()
            let signInVC  = signInNav.topViewController as!  SignInViewController
            signInVC.successClosure = { _ in
                self.navigationController?.dismiss(animated: true, completion: nil)
            }
            self.present(signInNav, animated: true, completion: nil)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
