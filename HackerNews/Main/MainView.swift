//
//  ContentView.swift
//  HackerNews
//
//  Created by Mustafa Ozhan on 25/07/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject
    var viewModel: MainViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Picker("Feed", selection: $viewModel.feedType) {
                    ForEach(FeedType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing], 16)
                
                if !viewModel.items.isEmpty {
                    List {
                        ForEach(viewModel.items, id: \.id) { item in
                            Text("\(item.title ?? "")")
                            // Row view and navigation here
                        }
                    }
                } else {
                    Spacer()
                }
                
            }
            .navigationBarTitle(Text("Hacker News"))
            
        }
        .onAppear {
            self.viewModel.onAppear()
        }
    }
}

#if DEBUG
struct MainViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
#endif
