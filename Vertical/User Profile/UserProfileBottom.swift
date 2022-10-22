
import SwiftUI

struct UserProfileBottom: View{
    
    @State private var tabSelected: Tab = .climbs
        
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                CustomTabBar(selectedTab: $tabSelected)
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            if(tab.rawValue == "climbs"){
                                UserProfileClimbList().background(.gray)
                            }
                            if(tab.rawValue == "videos"){
                                Text("\(tab.rawValue.capitalized)")
                                    .bold()
                                    .animation(nil, value: tabSelected)
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
                        }
                        .tag(tab)
                    }
                }
            }
        }.background(.gray)
    }
}

struct UserProfileBottom_Previews: PreviewProvider{
    static var previews: some View{
        UserProfileBottom()
    }
}
    

