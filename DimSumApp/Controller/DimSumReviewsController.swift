//
//  DimSumReviewsController.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class DimSumReviewsController: UITableViewController {
    
    @IBOutlet var dimSumReviewsTableView: UITableView!
    
    public var dimSum: DimSum!
    private var reviews = [DimSumReview]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = dimSum.foodEng
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reviews = DimSumReviewsManager.fetchAllReviews().filter { $0.dimSumFoodEng == dimSum.foodEng }
        print("Hello")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DimSumReviewCell") as? DimSumReviewCell else { return UITableViewCell() }
        let review = reviews[indexPath.row]
        cell.configureCell(review: review)
        return cell
    }
    
    
    @IBAction func goToCreateReviewPage(_ sender: UIBarButtonItem) {
        let reviewsStoryboard = UIStoryboard.init(name: "Reviews", bundle: nil)
        
        guard let createDimReviewVC = reviewsStoryboard.instantiateViewController(withIdentifier: "CreateDimReviewVC") as? DimSumWriteReviewController else { return }
        createDimReviewVC.dimSum = dimSum
        let navController = UINavigationController(rootViewController: createDimReviewVC)
        navController.modalPresentationStyle = .overFullScreen
        present(navController, animated: true, completion: nil)
    }
}
