import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    @Namespace private var animation   // for smooth highlight animation
    
    var body: some View {
        HStack{
            HStack(spacing: 0) {
                
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button(action: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            selectedTab = tab
                        }
                    }) {
                        VStack(spacing: 4) {
                            Image(tab.iconName)   // ✅ using Tab.swift icon
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text(tab.title)       // ✅ using Tab.swift title
                                .font(.caption)
                        }
                        .foregroundColor(selectedTab == tab ? .white : .gray)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if selectedTab == tab {
                                    Capsule()
                                        .fill(Color("Color_Tab_Bar"))
                                        .matchedGeometryEffect(id: "tabHighlight", in: animation)
                                }
                            }
                        )
                    }
                }
                
            }
            .padding(8)
            .background(
                Capsule()
                    .fill(Color("Tab_Bar_BG"))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 999)
                    .inset(by: 0.5)
                    .stroke(.white.opacity(0.3), lineWidth: 0.5)
            )
            
            // ✅ Show floating button only if Analytics is selected
            if selectedTab == .Analytics {
                Button(action: {
                // Action for +
                }) {
                Image(systemName: "plus")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundColor(Color("Color_Tab_Bar"))
                    .frame(width: 70, height: 70)
                    .background(Color.white)
                    .clipShape(Circle())
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 999)
                        .inset(by: 0.5)
                        .stroke(.white.opacity(0.3), lineWidth: 1)
                )
                .transition(.scale.combined(with: .opacity))  // ✅ nice animation
                .animation(.spring(), value: selectedTab)    // ✅ animate on change
            }
           
        }
        .padding(.horizontal, 16)
       
       
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.Analytics))
}
