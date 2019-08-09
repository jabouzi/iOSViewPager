//
//  ViewController.swift
//  ViewPager
//
//  Created by Skander Jabouzi on 2019-08-08.
//  Copyright © 2019 Skander Jabouzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, SlideButtonDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[Slide] = []
    var pageIndex:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        createSlides()
        setupSlideScrollView()
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }

    func createSlides() {        
        for i in 1...5 {
            createSlide(image: "soccer_\(i)")
        }
    }
    
    func createSlide(image: String) {
        let slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide.imageView.image = UIImage(named: image)
        slide.labelTitle.text = "A real-life bear 5"
        slide.labelDescription.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        slide.delegate = self
        slides.append(slide)
    }
    
    func setupSlideScrollView() {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.width)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    func didPressButton() {
        var frame = scrollView.frame;
        frame.origin.x = frame.size.width * CGFloat(pageIndex + 1);
        frame.origin.y = 0;
        scrollView.scrollRectToVisible(frame, animated: false)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSlideScrollView()
    }

}

