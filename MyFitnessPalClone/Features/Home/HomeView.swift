//
//  HomeView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 21.08.2024.
//

import SwiftUI

struct HomeView: View {
    private var user = UserManager.getUser()
    @State private var selectedTab: HomeTabs = .dashboard

    var body: some View {
        VStack {
            ScrollView {
                switch selectedTab {
                case .dashboard:
                    DashboardView().navigationBarBackButtonHidden()
                case .logFood:
                    LogFoodView()
                case .plans:
                    DashboardView()
                case .more:
                    LogFoodView()
                }
            }
            .allPadding()
            BottomTabBarView { tab in
                selectedTab = tab
            }
        }
//        .allPadding()
        .themedBackground()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Log Out", action: {
                    UserManager.setState(.loggedOut)
                    UserManager.removeUser()
                    _ = AuthService().signOut()
                })
            }
        }

//        .toolbar {
//            ToolbarItem(placement: .bottomBar) {
//                VStack {
//                    HStack {
//                        Image(systemName: "magnifyingglass")
//                        TextField("Search for a fodd", text: .constant(""))
//                        Image(systemName: "qrcode.viewfinder")
//                            .foregroundStyle(.cBlue)
//                    }
//                    .allPadding(.low)
//                    .rectangleFieldModifier()
//                }
//                .allPadding()
//            }
//        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}

struct CenteredCurveRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Sol alt köşeden başla
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))

        // Sol üst köşeye git
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + 15))

        // Sol üst köşeden merkeze doğru yükselen bir eğri oluştur
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control: CGPoint(x: rect.minX + (rect.width * 0.5) * 0.5, y: rect.minY - 0))

        // Merkezden sağ üst köşeye doğru alçalan bir eğri oluştur
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + 15),
                          control: CGPoint(x: rect.midX + (rect.width * 0.5) * 0.5, y: rect.minY - 0))

        // Sağ alt köşeye git
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        // Dikdörtgeni kapat
        path.closeSubpath()

        return path
    }
}
