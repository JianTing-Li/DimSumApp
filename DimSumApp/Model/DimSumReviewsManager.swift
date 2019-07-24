//
//  DimSumReviewsManager.swift
//  DimSumApp
//
//  Created by Jian Ting Li on 7/24/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

final class DimSumReviewsManager {
    private init() {}
    private static let filename = "DimSumReviews.plist"
    private static var reviews = [DimSumReview]()
    
    static public func fetchAllReviews() -> [DimSumReview] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                   reviews = try PropertyListDecoder().decode([DimSumReview].self, from: data)
                } catch {
                    print("Property List Decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) doesn't exist")
        }
        return reviews
    }
    
    static func saveReviewsToDocumentDirectory() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(reviews)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Proper List Encoding error: \(error)")
        }
    }
    
    static func addNewReview(review: DimSumReview) {
        reviews.append(review)
        saveReviewsToDocumentDirectory()
    }
    
    static func deleteReview(at index: Int) {
        reviews.remove(at: index)
        saveReviewsToDocumentDirectory()
    }
}
