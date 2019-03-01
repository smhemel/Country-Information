//
//  DetailsViewController.swift
//  Country Information
//
//  Created by S M HEMEL on 2/3/19.
//  Copyright © 2019 S M HEMEL. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var imageViewer: UIImageView!
    @IBOutlet weak var textShower: UITextView!
    
    var info: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textShower.text = info!
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
