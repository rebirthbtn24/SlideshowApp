//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 増田弘毅 on 2019/01/17.
//  Copyright © 2019 rebirthbtn24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    // 表示している画像の番号
    var dispImageNo = 0
    
    // 自動再生中かを判別するフラグ　1が再生中
    var AutoFlg = false
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if AutoFlg == true {
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func onTapImage(_ sender: Any) {
        self.timer?.invalidate()   // タイマーを停止する
        self.timer = nil
        
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func onPlay(_ sender: Any) {
        // timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            playButton.setTitle("停止",for:UIControl.State.normal)
            prevButton.isEnabled = false
            nextButton.isEnabled = false
            AutoFlg=true
        }
        else {
            self.timer?.invalidate()   // タイマーを停止する
            self.timer = nil
            playButton.setTitle("再生",for:UIControl.State.normal)
            prevButton.isEnabled = true
            nextButton.isEnabled = true
            AutoFlg=false
        }
    }
    
    
    @IBAction func onPrev(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func onNext(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "pet_cat_omoi_sleep_man.png",
            "petcart_cat.png",
            "text_toutoi.png",
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "pet_cat_omoi_sleep_man.png")
        // Image Viewに画像を設定
        imageView.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        //imageUp = dispImageNo
        resultViewController.dispImageNo = dispImageNo
    }

    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

