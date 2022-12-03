import SwiftUI

enum UserProfileTab: String, CaseIterable {
    case climbs
    case videos
    case filter
}

struct UserProfileTabBar: View {
    @Binding var selectedTab: UserProfileTab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .climbs:
            return .blue
        case .videos:
            return .indigo
        case .filter:
            return .orange
        }
        
    }
    var body: some View {
        VStack {
            HStack(spacing: 40){
                ForEach(UserProfileTab.allCases, id: \.rawValue) { tab in
                    Text(tab.rawValue)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                        .padding(10)
                        .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956).opacity(selectedTab == tab ? 1.0 : 0))
                        .foregroundColor(tab == selectedTab ? .white : .black)
                        .cornerRadius(20)
                }
            }
            .frame(width: nil, height: 40)
        }
    }
}

struct UserProfileTabBar_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileTabBar(selectedTab: .constant(.climbs))
    }
}
