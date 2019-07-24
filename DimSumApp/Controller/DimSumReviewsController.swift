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
                self.dimSumReviewsTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reviews = DimSumReviewsManager.fetchAllReviews().filter { $0.dimSumFoodEng == dimSum.foodEng }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dimSumReviewsTableView.dequeueReusableCell(withIdentifier: "DimSumReviewCell") as? DimSumReviewCell else { return UITableViewCell() }
        let review = reviews[indexPath.row]
        cell.configureCell(review: review)
        return cell
    }
}
