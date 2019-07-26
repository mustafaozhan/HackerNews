//
//  ContentView.swift
//  HackerNews
//
//  Created by Mustafa Ozhan on 25/07/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObjectBinding
    var viewModel: MainViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                Text("Test")
                
            }.navigationBarTitle(Text("Hacker News"))
            
        }.onAppear(perform: {
            self.viewModel.viewDidAppear.send(())
        })
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
#endif
