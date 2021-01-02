//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 辻志保美 on 2020/12/29.
//

import UIKit

class ZoomViewController: UIViewController, UIScrollViewDelegate {
    // Outletの接続
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    // ViewControllerから渡される画像情報を宣言
    var zoomImg: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = zoomImg
        //imageView = UIImageView(image: zoomImg)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.delegate = self
        scrollView.maximumZoomScale = 8.0
        scrollView.minimumZoomScale = 1.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
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
