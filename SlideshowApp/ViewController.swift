//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 辻志保美 on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {
    // Outletの接続
    @IBOutlet weak var imageView: UIImageView!
    
    // 表示する写真を宣言
    var images: [UIImage?] = []
    
    // 写真の配列に指定する番号を宣言
    var number: Int = 0
    
    // タイマーを宣言
    var timer: Timer?
    
    // 拡大する画像を宣言
    var zoomImg: UIImage?
    
    // 進むボタン
    @IBOutlet weak var nextButton: UIButton!
    
    // 戻るボタン
    @IBOutlet weak var backButton: UIButton!
    
    //再生・停止ボタン
    @IBOutlet weak var startStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 利用している写真
        images = [UIImage(named:"pic1.jpeg"), UIImage(named:"pic2.jpeg"), UIImage(named:"pic3.jpeg"), UIImage(named:"pic4.jpeg"), UIImage(named:"pic5.jpeg")]
        
        // 初期表示の写真
        imageView.image = images.first ?? UIImage(named: "pic1.jpeg")
    }

    // 再生/停止ボタンの処理
    @IBAction func startStop(_ sender: Any) {
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage(_:)), userInfo: nil, repeats: true)
            //進む、戻るボタンの押下不可
            nextButton.isEnabled = false
            backButton.isEnabled = false
            //ボタンの表示変更
            startStopButton.setTitle("停止", for: .normal)
        } else {
            timer?.invalidate()
            timer = nil
            //進む、戻るボタンの押下可
            nextButton.isEnabled = true
            backButton.isEnabled = true
            //ボタンの表示変更
            startStopButton.setTitle("再生", for: .normal)
        }
    }

    @objc func changeImage(_ timer: Timer){
        if number < images.count - 1 {
            number += 1
            imageView.image = images[number]
        } else {
            number = 0
            imageView.image = images[number]
        }
    }

    // 進むボタンの処理
    @IBAction func next(_ sender: Any) {
        if timer == nil {
            if number < images.count - 1 {
                number += 1
                imageView.image = images[number]
            } else {
                number = 0
                imageView.image = images[number]
            }
        }
    }
    
    // 戻るボタンの処理
    @IBAction func back(_ sender: Any) {
        if timer == nil {
            if number > 0 {
                number -= 1
                imageView.image = images[number]
            } else {
                number = 4
                imageView.image = images[number]
            }
        }
    }
    
    // 遷移先に画像情報を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のZoomViewControllerを取得する
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        // 遷移先のZoomViewControllerで宣言しているzoomImgに値を代入して渡す
        zoomViewController.zoomImg = images[number]
        //タップ時にタイマーを削除
        timer?.invalidate()
        timer = nil
        //進む、戻るボタンの押下可
        nextButton.isEnabled = true
        backButton.isEnabled = true
        //ボタンの表示変更
        startStopButton.setTitle("再生", for: .normal)
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
}

