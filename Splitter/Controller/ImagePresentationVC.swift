//
//  DetailViewController.swift
//  Splitter
//
//  Created by Mariah Baysic on 3/31/20.
//  Copyright © 2020 SpacedOut. All rights reserved.
//

import UIKit

class ImagePresentationVC: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image = image
    }

}

