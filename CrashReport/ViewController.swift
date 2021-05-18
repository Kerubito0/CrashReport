//
//  ViewController.swift
//  CrashReport
//
//  Created by kerubito on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CrashReport.fetch()
    }
    
    @IBAction func crash() {
        let a: Int? = nil
        let b: Int = 1 + a!
    }


}

