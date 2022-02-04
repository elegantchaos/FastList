// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 27/01/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

struct InnerListView<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
    @Environment(\.defaultMinListRowHeight) var minHeight
    
    let data: Data
    let configuration: ListConfiguration
    let content: (Data.Element) -> Content
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            if configuration.showInitialDivider {
                Divider()
            }
            
            ForEach(data) { item in
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    content(item)
                    Spacer()
                    
                    if configuration.showDividers {
                        Divider()
                    }
                }
                .frame(minHeight: minHeight)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.primary)
    }
}
