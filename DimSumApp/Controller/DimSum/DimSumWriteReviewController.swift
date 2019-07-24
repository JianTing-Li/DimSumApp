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
        configureTextView()
        configureRatingCosmos()
    }
    
    private func configureRatingCosmos() {
        rating.didFinishTouchingCosmos = { rating in
            self.capturedRating = rating
        }
    }
    
    private func configureTextView() {
        reviewTextView.delegate = self
        reviewTextView.textColor = .lightGray
        reviewTextView.text = "Write your review here..."
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postButtonPressed(_ sender: UIBarButtonItem) {
        guard let capturedRating = capturedRating,
            let reviewDescription = reviewTextView.text,
            !reviewDescription.isEmpty else {
                showAlert(title: "Missing Fields", message: "Make sure you give a rating and review.")
                return
        }
        let dimSumReview = DimSumReview(dimSumFoodEng: <#T##String#>, userID: nil, reviewID: nil, rating: capturedRating, description: reviewDescription, location: nil)
    }
    
}

extension DimSumWriteReviewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write your review here..." {
            textView.textColor = .black
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.textColor = .lightGray
            textView.text = "Write your review here..."
        }
    }
}
