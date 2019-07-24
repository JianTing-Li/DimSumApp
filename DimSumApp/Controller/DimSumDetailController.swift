//
//  DimSumDetailController.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit
import Cosmos
import AVFoundation

class DimSumDetailController: UIViewController {
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var chineseLabel: UILabel!
    @IBOutlet weak var dimSumImage: UIImageView!
    @IBOutlet weak var dimSumDescriptionTextView: UITextView!
    @IBOutlet weak var dimSumRating: CosmosView!
    
    public var dimSum: DimSum!
    private var audioPlayer: AVAudioPlayer?
    private var reviews = [DimSumReview]() {
        didSet {
            if self.reviews.count > 0 { setRating() }
        }
    }
    
    let defaults = UserDefaults.standard
    private lazy var favorites = defaults.object(forKey: UserDefaultsKeys.dimSumFavorites) as? [String : Bool] ?? [String : Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        setFavoriteIcon()
        engLabel.text = dimSum.foodEng
        chineseLabel.text = dimSum.foodChi
        dimSumImage.image = UIImage.init(named: dimSum.foodEng.components(separatedBy: " ").joined() + "0")
        dimSumDescriptionTextView.text = dimSum.foodDescription
        dimSumRating.settings.updateOnTouch = false
        dimSumRating.settings.fillMode = .half
        reviews = DimSumReviewsManager.fetchAllReviews().filter { $0.dimSumFoodEng == dimSum.foodEng }
    }
    
    private func setRating() {
        dimSumRating.rating = reviews.map { $0.rating }.reduce(0,+) / Double(reviews.count)
    }
    
    private func setFavoriteIcon() {
        if let _ = favorites[dimSum.foodEng] {
            navigationItem.rightBarButtonItem?.image = UIImage(named: "like_filled")
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(named: "like")
        }
    }
    
    private func playAudio(fileName: String, fileType: String) {
        if let soundUrl = Bundle.main.url(forResource: fileName, withExtension: fileType) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            } catch {
                print(error)
            }
        } else {
            print("No URL for Sound")
        }
    }
    
    @IBAction func playCantonese(_ sender: UIButton) {
        let dimSumAudioFileName = dimSum.foodEng.components(separatedBy: " ").joined()
        switch sender.tag {
        case 0: // female
            playAudio(fileName: "\(dimSumAudioFileName)F", fileType: "mp3")
        case 1: // male
            playAudio(fileName: "\(dimSumAudioFileName)M", fileType: "mp3")
        default:
            break
        }
        audioPlayer?.play()
    }
    
    @IBAction func favoriteDimSum(_ sender: UIBarButtonItem) {
        if let _ = favorites[dimSum.foodEng] {
            favorites[dimSum.foodEng] = nil
            navigationItem.rightBarButtonItem?.image = UIImage(named: "like")
            showAlert(title: "Dim Sum Unfavorited", message: nil)
        } else {
            favorites[dimSum.foodEng] = true
            navigationItem.rightBarButtonItem?.image = UIImage(named: "like_filled")
            showAlert(title: "Dim Sum Favorited", message: nil)
        }
        defaults.set(favorites, forKey: UserDefaultsKeys.dimSumFavorites)
    }
    
    @IBAction func openReviewsScreen(_ sender: UIButton) {
        let reviewsStoryboard = UIStoryboard(name: "Reviews", bundle: nil)
        let destinationVC = reviewsStoryboard.instantiateViewController(withIdentifier: "DimSumReviewsVC") as! DimSumReviewsController
        destinationVC.dimSum = dimSum
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
