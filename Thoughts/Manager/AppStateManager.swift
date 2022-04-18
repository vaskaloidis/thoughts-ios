//
//  AppStateManager.swift
//  Thoughts
//
//  Created by Vas Kaloidis on 4/17/22.
//

import Foundation

enum SessionType {
    case normal
    case special
}

enum AppState: Hashable {
  case home
  case actionSheet
  case intro(sessionType: SessionType)
  case session
}

struct CurrentUser {
  var id: String
  var email: String
  var firstName: String
  var lastName: String
  var token: String
}

class AppStateManager: ObservableObject {
    static let shared = AppStateManager()

    @Published var selectedTab: AppState = .home {
      willSet {
        oldSelectedItem = selectedTab
      }
      didSet {
          if selectedTab == .actionSheet {
          shouldShowActionSheet = true
          selectedTab = oldSelectedItem
        }
        resetNavigationID = UUID()
      }
    }
    
    @Published var shouldShowActionSheet = false
    @Published private var oldSelectedItem: AppState = .home
    @Published var resetNavigationID = UUID()
    @Published var showSheet: Bool = false
    @Published var showConfirmationModal: Bool = false
}

extension AppStateManager {
  static func mock() -> AppStateManager {
    return AppStateManager()
  }
}
