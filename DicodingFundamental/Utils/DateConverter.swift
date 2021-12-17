//
//  DateFormatter.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 05/11/21.
//

import Foundation

extension String {
  func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Take a look to your format")
    }
    return date
  }
}
extension Date {
   func getFormattedDate(format: String = "MMM d, yyyy") -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
