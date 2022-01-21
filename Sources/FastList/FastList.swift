// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 21/01/2022.
//  All code (c) 2022 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public struct FastList<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
    @Environment(\.defaultMinListRowHeight) var minHeight
    
    public var data: Data
    public var content: (Data.Element) -> Content
    
    public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                Divider()
                
                ForEach(data) { item in
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer()
                        content(item)
                        Spacer()
                        Divider()
                    }
                    .frame(minHeight: minHeight)
                }
            }
        }
        .foregroundColor(.primary)
        .padding(.horizontal)
    }
    
}
