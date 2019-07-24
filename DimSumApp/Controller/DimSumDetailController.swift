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
    
    let defaults = UserDefaults.standard
    private lazy var favorites = defaults.object(forKey: UserDefaultsKeys.dimSumFavorites) as? [String : Bool] ?? [String : Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        engLabel.text = dimSum.foodEng
        chineseLabel.text = dimSum.foodChi
        dimSumImage.image = UIImage.init(named: dimSum.foodEng.components(separatedBy: " ").joined() + "0")
        dimSumDescriptionTextView.text = dimSum.foodDescription
        setRating()
        setFavoriteIcon()
    }
    
    private func setRating() {
        
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
//        guard let bookingController = UIStoryboard(name: "BookService", bundle: nil).instantiateViewController(withIdentifier: "BookingController") as? BookingViewController else {return}
//        guard let provider = provider else {return}
//        bookingController.rating = rating ?? 5.0
//        bookingController.provider = provider
//        let bookingNavController = UINavigationController(rootViewController: bookingController)
//        self.present(bookingNavController, animated: true, completion: nil)
        
        
        
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//
//        //get view controller in a variable
//        guard let viewController = storyboard.instantiateViewController(withIdentifier: "secondDetail") as? SecondDetailViewController else { return }
//
//        //this will put a layer and see through it when it segues. Make sure the opaque is 20%
//        //*this makes it come up from bottom up
//        viewController.modalPresentationStyle = .overCurrentContext //the view will show
//
//        viewController.animal = myAnimals2[indexPath.row]
//
//        //*Make it Segue
//        //controller represents the ViewController I want to transition to
//        //complete is code that I want to run after this function is executed
//        present(viewController, animated: true, completion: nil)
    }
}
