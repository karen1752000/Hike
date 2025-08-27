//
//  CustomListRowView.swift
//  Hike
//
//  Created by Karen Mitchell on 8/26/25.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkedLabel: String? = nil
    @State var rowLinkedDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            // Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinkedLabel != nil && rowLinkedDestination != nil) {
                Link(rowLinkedLabel!, destination: URL(string: rowLinkedDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            //: Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkedLabel: "Credo Academy",
            rowLinkedDestination: "https://learn.credo.academy/"
        )
    }
}
