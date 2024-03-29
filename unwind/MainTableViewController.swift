//
//  MainTableViewController.swift
//  unwind
//
//  Created by Yvonne on 2019/12/17.
//  Copyright © 2019 Yvonne. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var addIns = [AddIn] ()
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           
           addIns.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .automatic)
       }
    
    
    @IBAction func unwindToEditTableView(segue: UIStoryboardSegue){
        if let source = segue.source as? EditTableViewController, let addIn = source.addIn{
            if let indexPath = tableView.indexPathForSelectedRow {
                           addIns[indexPath.row] = addIn
                           tableView.reloadRows(at: [indexPath], with: .automatic)
            } else{

            addIns.insert(addIn, at: 0)
            let newIndexPath = IndexPath(row: 0, section: 0)
                tableView.insertRows(at:[newIndexPath], with: .automatic)}
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return addIns.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let addIn = addIns[indexPath.row]
        cell.textLabel?.text = addIn.name
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           if let controller = segue.destination as? EditTableViewController, let row = tableView.indexPathForSelectedRow?.row {
               controller.addIn = addIns[row]
               
           }
           
       }
    
}
