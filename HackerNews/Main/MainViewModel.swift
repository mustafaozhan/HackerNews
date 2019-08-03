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
    @Published var items = [Item]()
    
    let willChange = PassthroughSubject<MainViewModel, Never>()
    let viewDidAppear = PassthroughSubject<Void, Never>()
    
    private let perPage = 12
    private var isLoading = false
    private var cancelable: Cancellable?
    
    private var feed = [Int]() {
        didSet { fetchItems(ids: feed.prefix(perPage))}
    }
    
    var hasMoreItems: Bool { items.count < feed.count }
    
    var feedType = FeedType.top {
        didSet {
            items.removeAll()
            fetchFeed(type: feedType)
        }
    }
    
    deinit { cancelable?.cancel() }
    
    func onAppear() { fetchFeed(type: feedType) }
    
    func loadMoreItems() {
        fetchItems(
            ids: feed.dropLast(items.count)
                .prefix(perPage)
        )
    }
    
    func fetchFeed(type: FeedType) {
        if isLoading {
            return
        }
        isLoading = true
        
        cancelable = HackerNewsAPI.FetchFeed(type: type)
            .sink(receiveCompletion: {
                if case let .failure(error) = $0 {
                    print(error)
                }
            }, receiveValue: {
                self.isLoading = false
                self.feed = $0
            })
    }
    func fetchItems<S>(ids: S)
        where S: Sequence,
        S.Element == Int {
            if isLoading {
                return
            }
            isLoading = true
            
            cancelable = Publishers.MergeMany(ids.map { HackerNewsAPI.FetchItem(id: $0) })
                .collect()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: {
                    if case let .failure(error) = $0 {
                        print(error)
                    }
                }, receiveValue: {
                    self.isLoading = false
                    self.items += $0
                })
    }
}
