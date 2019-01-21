//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 増田弘毅 on 2019/01/21.
//  Copyright © 2019 rebirthbtn24. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var imageUp = 0
    var dispImageNo = 0
    
    @IBAction func onBack(_ sender: Any) {
    }
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var onBack: UIButton!
    
    func displayImage(){
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
        let image = UIImage(named: name)!
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
        // 画像を拡大
        imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
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
