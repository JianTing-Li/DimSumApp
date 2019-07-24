//
//  DimSumWriteReviewController.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit
import Cosmos

class DimSumWriteReviewController: UIViewController {

    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var reviewTextView: UITextView!
    
    private var capturedRating: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup cosmos
//        // Called when user finishes changing the rating by lifting the finger from the view.
//        // This may be a good place to save the rating in the database or send to the server.
//        cosmosView.didFinishTouchingCosmos = { rating in }
        
        
        // setup text field (refer to fellow blogger)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postButtonPressed(_ sender: UIBarButtonItem) {
        // check if user give a rating and description (make sure it's not empty)
        // instatiate review and save to data persistence
    }
    
}


//private func configureTextView() {
//    configureInputAccessoryView()
//    blogDescriptionTextView.delegate = self
//    blogDescriptionTextView.textColor = .lightGray
//    blogDescriptionTextView.text = Constants.BlogDescriptionPlaceholder
//}
//
//extension AddBlogController: UITextViewDelegate {
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == Constants.BlogDescriptionPlaceholder {
//            textView.textColor = .black
//            textView.text = ""
//        }
//    }
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text == "" {
//            textView.textColor = .lightGray
//            textView.text = Constants.BlogDescriptionPlaceholder
//        }
//    }
//}
