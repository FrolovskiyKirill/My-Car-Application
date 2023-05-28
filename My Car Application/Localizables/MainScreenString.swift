//
//  MainScreenString.swift
//  My Car App
//
//  Created by Kirill Frolovskiy on 28.05.2023.
//

import Foundation

enum MainScreenString: String {

  case navigationBarTitle
  case rightBarButtonTitle

  var localized: String {
    NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
  }
}
