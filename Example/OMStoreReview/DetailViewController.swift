//
//  DetailViewController.swift
//  OMStoreReview_Example
//
//  Created by Erik Flores on 15/03/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import OMStoreReview

class DetailViewController: UIViewController {

    @IBOutlet var closeModal: UIPanGestureRecognizer!
    let reviewStore = OMStoreReview()

    override func viewDidLoad() {
        super.viewDidLoad()
        closeModal = UIPanGestureRecognizer(target: self, action: #selector(closeModaly))
        view.addGestureRecognizer(closeModal)
    }

    @objc func closeModaly(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: self.view)
        if velocity.y > 0 {
            self.dismiss(animated: true, completion: nil)
        }
    }


    @IBAction func buy(_ sender: UIButton) {
        reviewStore.request()
    }

}
