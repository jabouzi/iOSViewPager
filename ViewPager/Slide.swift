//
//  Slide.swift
//  ViewPager
//
//  Created by Skander Jabouzi on 2019-08-08.
//  Copyright © 2019 Skander Jabouzi. All rights reserved.
//

import UIKit

protocol SlideButtonDelegate {
    func didPressButton()
}

class Slide: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var delegate : SlideButtonDelegate!
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        delegate?.didPressButton()
    }
}
