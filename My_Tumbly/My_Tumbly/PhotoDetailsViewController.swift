//
//  PhotoDetailsViewController.swift
//  My_Tumbly
//
//  Created by Derrick Chong on 2/9/17.
//  Copyright © 2017 DerrickCorp. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var imagebox: UIImageView!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var summarylabel: UILabel!
    var posts: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let date = posts["date"] as! String
        datelabel.text = date
        
        let summary = posts["summary"] as! String
        summarylabel.text = summary
        
        if let photos = posts.value(forKeyPath: "photos") as? [NSDictionary] {
            
            let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
            
            if let imageUrl = URL(string: imageUrlString!) {
                imagebox.setImageWith(imageUrl)
            }
            else {
                // no imageURL! for photo
            }
        }
        else {
            // no photos for post!
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
