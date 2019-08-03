//
//  ItemView.swift
//  HackerNews
//
//  Created by Mustafa Ozhan on 03/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if item.title != nil {
                Text(item.title!)
                    .font(.headline)
                    .lineLimit(nil)
            } else if item.text != nil {
                Text(item.text!)
                    .font(.subheadline)
                    .lineLimit(nil)
            }
            
            HStack {
                
                Text("by \(item.by) \(item.time)")
                    .foregroundColor(.gray)
                
                Image(systemName: "hand.thumbsup")
                    .foregroundColor(.gray)
                    .imageScale(.small)
                
                Text("\(item.score)")
                    .foregroundColor(.gray)
                
                Image(systemName: "bubble.right")
                    .foregroundColor(.gray)
                    .imageScale(.small)
                
                Text("\(item.kids.count)")
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }.padding([.top, .bottom], 4)
    }
}

#if DEBUG
struct ItemViewPreviews: PreviewProvider {
    static var previews: some View {
        ItemView(
            item: Item(
                by: "Someone",
                id: 123,
                kids: [1, 2],
                score: 1,
                time: Date(
                    timeIntervalSince1970: TimeInterval(
                        exactly: 123123123.4
                        )!
                ),
                title: "Title",
                text: "Some text",
                url: "url"
            )
        )
    }
}
#endif
