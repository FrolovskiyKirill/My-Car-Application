//
//  ExpenseListScreenString.swift
//  My Car Application
//
//  Created by Kirill Frolovskiy on 28.05.2023.
//

import Foundation

enum ExpensesListScreenString: String {

  case navigationBarTitle

  var localized: String {
    NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
  }
}
