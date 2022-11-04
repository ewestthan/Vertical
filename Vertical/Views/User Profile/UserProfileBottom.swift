
import SwiftUI

struct UserProfileBottom: View{
    
    @State private var tabSelected: UserProfileTab = .climbs
    
    var body: some View {
        ZStack {
            VStack {
                UserProfileTabBar(selectedTab: $tabSelected)
                Divider()
                TabView(selection: $tabSelected) {
                    ForEach(UserProfileTab.allCases, id: \.rawValue) { tab in
                        HStack {
                            if(tab.rawValue == "climbs"){
                                UserProfileClimbList()
                            }
                            if(tab.rawValue == "videos"){
                                UserProfileVideos()
                            }
                            if(tab.rawValue == "wishlist"){
                                Text("\(tab.rawValue.capitalized)")
                                    .bold()
                                    .animation(nil, value: tabSelected)
                            }
                            if(tab.rawValue == "info"){
                                Text("\(tab.rawValue.capitalized)")
                                    .bold()
                                    .animation(nil, value: tabSelected)
                            }
                            if(tab.rawValue == "filter"){
                                UserProfileFilter()
                            }
                        }
                        .tag(tab)
                    }
                    .background(Color(.gray).opacity(0.2))
                }
            }
        }.padding([.top], 10)
            .background(Color(.gray).opacity(0.2))
    }
}

struct UserProfileBottom_Previews: PreviewProvider{
    static var previews: some View{
        UserProfileBottom()
    }
}
    

