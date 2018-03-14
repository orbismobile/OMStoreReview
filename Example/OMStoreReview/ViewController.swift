//
//  ViewController.swift
//  OMStoreReview
//
//  Created by Erik Flores on 03/14/2018.
//  Copyright (c) 2018 Erik Flores. All rights reserved.
//

import UIKit
import OMStoreReview

class ViewController: UIViewController {

    let reviewStore = OMStoreReview()

    override func viewDidLoad() {
        reviewStore.resetRun()
        super.viewDidLoad()

    }

    @IBAction func pressMe(_ sender: Any) {
        reviewStore.request()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

