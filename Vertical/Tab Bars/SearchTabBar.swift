import SwiftUI

enum SearchTab: String, CaseIterable {
    case users
    case climbs
    case areas
}

struct SearchTabBar: View {
    @Binding var selectedTab: SearchTab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .users:
            return .orange
        case .climbs:
            return .orange
        case .areas:
            return .orange
        }
        
    }
    var body: some View {
        VStack {
            HStack(spacing: 70){
                ForEach(SearchTab.allCases, id: \.rawValue) { tab in
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

struct SearchTabBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabBar(selectedTab: .constant(.users))
    }
}
