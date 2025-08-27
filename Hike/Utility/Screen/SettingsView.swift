//
//  SettingsView.swift
//  Hike
//
//  Created by Karen Mitchell on 8/25/25.
//

import SwiftUI

struct SettingsView: View {
    // MARK: -PROPERTIES
  
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            // MARK: - SECTION HEADER
           
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size:80,weight: .black))
                    
                    VStack(spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size:80,weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(LinearGradient(
                    colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nthe perfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("Hikes are stunning in photos, but it's even more breathtaking in person. These are the kind of hike you'll want to do again and again! \nFind the best day hike in our app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off those boots, \nIt's time to get out there!")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenDark)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth:.infinity)
            } //: HEADER SECTION
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION ICONS
           
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices,id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) was pressed.")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Failed request to update the app icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success! You have changed the app's icon to alternate icon \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                } //: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Choose you favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } //: SECTION
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION ABOUT
           
            Section(
                header: Text("About this Application"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © 2025 All rights reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // 1. Basic Labeled Content
                
                // 2. Advanced Labeled Content
              
                CustomListRowView (
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "HIKE",
                    rowTintColor: .blue
                )
                
                CustomListRowView (
                    rowLabel: "Compatibility",
                    rowIcon: "info.circle",
                    rowContent: "iOS, iPadOS",
                    rowTintColor: .red
                )
                
                CustomListRowView (
                    rowLabel: "Technology",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange
                )
                
                CustomListRowView (
                    rowLabel: "Version",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple
                )
                
                CustomListRowView (
                    rowLabel: "Developer",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "Karen Mitchell",
                    rowTintColor: .mint
                )
               
                CustomListRowView (
                    rowLabel: "Designer",
                    rowIcon: "paintpalette",
                    rowContent: "Robert Petras",
                    rowTintColor: .pink
                )
                
                CustomListRowView (
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowTintColor: .indigo,
                    rowLinkedLabel: "Credo Academy",
                    rowLinkedDestination: "https://learn.credo.academy/"
                )
                
            }
        } //: SECTION
    } //: LIST
}

#Preview {
    SettingsView()
}
