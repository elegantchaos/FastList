// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 21/01/2022.
//  All code (c) 2022 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

struct FastList<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
    @Environment(\.lineSpacing) var lineSpacing
    
    public var data: Data
    public var content: (Data.Element) -> Content

    public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
    }

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: lineSpacing) {
                ForEach(data) { item in
                    content(item)
                    Divider()
                }
            }
        }
        .foregroundColor(.primary)
        .padding(.horizontal)
    }
    
}
