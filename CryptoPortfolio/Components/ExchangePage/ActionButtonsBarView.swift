import SwiftUI

struct ActionButtonsBarView: View {
    @Binding var showOverlays: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            // Send Button
            Button(action: {
                
            }) {
                Image(systemName: "arrow.up")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 64, height: 64)
                    .background(Color("Custom_Gray_BG"))
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .inset(by: 0.5)
                            .stroke(.white.opacity(0.3), lineWidth: 0.25)
                    )
            }
            
            //Exchange button // Exchange Button (Navigation)
            NavigationLink(destination: ExchangeView()
                .onAppear { showOverlays = false }   // hide TopMenu + TabBar
                .onDisappear { showOverlays = true }
            ) {
                   Image(systemName: "plus")
                       .font(.system(size: 24, weight: .semibold))
                       .foregroundColor(.white)
                       .frame(width: 64, height: 64)
                       .background(Color("Custom_Gray_BG"))
                       .clipShape(Circle())
                       .overlay(
                           RoundedRectangle(cornerRadius: 100)
                               .inset(by: 0.5)
                               .stroke(.white.opacity(0.3), lineWidth: 0.25)
                       )
               }
            
            // Receive Button
            Button(action: {
                
            }) {
                Image(systemName: "arrow.down")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 64, height: 64)
                    .background(Color("Custom_Gray_BG"))
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .inset(by: 0.5)
                            .stroke(.white.opacity(0.3), lineWidth: 0.25)
                    )
            }
        }
        .padding(12)        
    }
}
#Preview {
    ActionButtonsBarView(showOverlays: .constant(true))
}
