import SwiftUI

enum ClimbProfileTab: String, CaseIterable {
    case ascents
    case filter
}

struct ClimbProfileTabBar: View {
    @Binding var selectedTab: ClimbProfileTab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .ascents:
            return .blue
        case .filter:
            return .orange
        }
        
    }
    var body: some View {
        VStack {
            HStack(spacing: 10){
                ForEach(ClimbProfileTab.allCases, id: \.rawValue) { tab in
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

struct ClimbProfileTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfileTabBar(selectedTab: .constant(.ascents))
    }
}
