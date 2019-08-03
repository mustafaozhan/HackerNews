//
//  MainViewModel.swift
//  HackerNews
//
//  Created by Mustafa Ozhan on 25/07/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {
    let willChange = PassthroughSubject<MainViewModel, Never>()
    let viewDidAppear = PassthroughSubject<Void, Never>()
    var items = [Item]() {
        didSet { willChange.send(self) }
    }
}
