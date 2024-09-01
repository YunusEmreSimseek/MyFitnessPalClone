//
//  BottomTabBarView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 25.08.2024.
//

import SwiftUI

struct BottomTabBarView: View {
    @State private var selectedTab: HomeTabs = .dashboard
    var completion: (HomeTabs) -> Void
    var body: some View {
        VStack {
            if selectedTab == .dashboard {
                HStack(spacing: .low) {
                    Image(systemName: "magnifyingglass")
                    TextField("Search for a food", text: .constant(""))
                        .subTitleText()
                    Image(systemName: "qrcode.viewfinder")
                        .foregroundStyle(.cBlue)
                }
                .allPadding(.low2)
                .hPadding(.low2)
                .background(.cWhite)
                .clipShape(.rect(cornerRadius: .medium3))
                .transition(.scale)
            }

            HStack {
                TabColumn(imageName: selectedTab == .dashboard ? "house.fill" : "house",
                          title: "Dashboard", selectedTab: $selectedTab)
                    .onTapGesture {
                        withAnimation { selectedTab = .dashboard }
                        completion(selectedTab)
                    }
                Spacer()
                TabColumn(imageName: selectedTab == .logFood ? "book.fill" : "book",
                          title: "Log Food", selectedTab: $selectedTab)
                    .onTapGesture {
                        withAnimation { selectedTab = .logFood }
                        completion(selectedTab)
                    }
                Spacer()
                TabColumn(imageName: selectedTab == .plans ? "list.clipboard.fill" : "list.clipboard",
                          title: "Plans", selectedTab: $selectedTab)
                    .onTapGesture {
                        withAnimation { selectedTab = .plans }
                        completion(selectedTab)
                    }
                Spacer()
                TabColumn(imageName: selectedTab == .more ? "ellipsis.rectangle.fill" : "ellipsis.rectangle", title: "More", selectedTab: $selectedTab)
                    .onTapGesture {
                        withAnimation { selectedTab = .more }
                        completion(selectedTab)
                    }
            }
        }
        .hPadding()
        .topPadding()
        .bottomPadding(.low3)
        .background(.cBlue)
        .clipShape(CenteredCurveRectangle())
    }
}

#Preview {
    BottomTabBarView(completion: { tab in
        print("tab changed to \(tab)")
    })
}

enum HomeTabs {
    case dashboard
    case logFood
    case plans
    case more
}

private struct TabColumn: View {
    let imageName: String
    let title: String
    @Binding var selectedTab: HomeTabs
    var body: some View {
        VStack(spacing: .veryLow2) {
            Image(systemName: imageName)
                .font(.title3)
                .frame(height: .medium2)
                .foregroundStyle(.cWhite)
            Text(title)
                .font(.caption)
        }
    }
}
