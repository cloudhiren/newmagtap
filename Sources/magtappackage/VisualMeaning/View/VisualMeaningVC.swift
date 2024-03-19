//
//  VisualMeaningVC.swift
//  
//
//  Created by Hiren on 18/03/24.
//

import UIKit
import SDWebImage

class VisualMeaningVC: UIViewController {

    
    @IBOutlet weak var lblWordEnglish: UILabel!
    @IBOutlet weak var lblWordTranslation: UILabel!
    @IBOutlet weak var imgDescImage: UIImageView!
    @IBOutlet weak var lblDescTranslated: UILabel!
    
    var wordParam: VisualMeaningModel?
    var WordMeaning: WordMeaningModel?
    var word = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgDescImage.layer.cornerRadius = 8
        getWordMeaning()
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

extension VisualMeaningVC {
    func getWordMeaning() {
        WordMeaningViewModel().WordMeaningApi(text: word) { responce in
            if responce?.error == false {
                self.WordMeaning = responce
                print(self.WordMeaning?.data.data.imageDescTranslated ?? "")
                let details = self.WordMeaning?.data.data
                self.lblWordEnglish.text = details?.wordEnglish ?? ""
                self.lblWordTranslation.text = details?.wordMeaningTranslated[0] ?? ""
                self.lblDescTranslated.text = details?.imageDescTranslated[0] ?? ""
                self.imgDescImage.sd_setImage(with: URL(string: "\(details?.compressLink ?? "")\(details?.imageCompress[0] ?? "")"), placeholderImage: UIImage(named: "ImageNotAvailable"))
            } else {
                print(responce?.message ?? "Somthing wrong")
            }
        }
    }
}
