import SwiftUI

struct ExchangeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20) {
                    // Top Bar
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Circle()
                                .fill(Color("Custom_Gray_BG"))
                                .frame(width: 36, height: 36)
                                .overlay(Image(systemName: "chevron.left"))
                                    .font(.title3)
                                    .foregroundColor(.white)
                                
                        }
                        .padding(.trailing, 20)
                        Text("Exchange")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Spacer() // keeps "Exchange" centered
                    }
                    .padding(.horizontal, 5)
                    .padding(.bottom, 10)

                    

                    // === ONE STACK BACKGROUND ===
                    VStack(spacing: 0) {
                    
                        // Send Card
                        VStack(alignment: .leading) {
                            HStack {
                                HStack() {
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 36, height: 36)
                                        .overlay(Image("Ether_Logo")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.white))
                                        .padding(.trailing, 12)
                                    
                                    Text("ETH")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .fontWeight(.regular)
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.gray)
                                    }
                                Spacer()
                                Text("Send")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                }
                            .padding(.top,32)
                            .padding(.bottom, 16)
                            
                            
                            Text("2.640")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            .padding(.bottom,20)
                            
                            HStack{
                                Text("Balance")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                    .fontWeight(.regular)
                                Spacer()
                                
                                Text("10.254")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .fontWeight(.regular)
                            }
                        }
                        .padding(.horizontal)
            
                        // Divider + Swap Button
                        ZStack {
                            HStack{
                                Text("  ")
                                    .frame(maxWidth: .infinity, minHeight: 10 ,maxHeight: 10)
                                .background(.black)
                            }
                            
                            Button(action: {}) {
        //                        RoundedRectangle(cornerRadius: 10)
        //                            .fill(Color("Custom_Gray_BG"))
        //                            .frame(width: 52, height: 52)
        //                            .overlay(Image("Exchange_View_Exchange_Icon")
        //                                .resizable()
        //                                .scaledToFit()
        //                                .foregroundColor(.white))
        //                                .padding(10)
                            Image("Exchange_View_Exchange_Icon")
                                .foregroundColor(.white)
                                .frame(width: 36, height: 36)
                                .padding(8)
        //                        .background(Color("Custom_Dark_Gray_BG"))
                                .background(
                                    LinearGradient(
                                        colors: [Color("Custom_Gray_BG"),
                                                 Color("Custom_Dark_Gray_BG"),
                                                 Color("Custom_Dark_Gray_BG"),
                                                 Color("Custom_Dark_Gray_BG")], // gradient colors
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        
                        // Receive Card
                        VStack(alignment: .leading) {
                            HStack {
                                HStack {
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 36, height: 36)
                                        .overlay(Image("INR_Currency_Logo")
                                            .foregroundColor(.white))
                                        .padding(.trailing, 12)
                                    
                                    Text("INR")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .fontWeight(.regular)
                                    
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text("Receive")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                            }
                            .padding(.top,32)
                            .padding(.bottom, 16)

                            
                            Text("₹ 4,65,006.44")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            .padding(.bottom,20)
                            
                            HStack{
                                Text("Balance")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                    .fontWeight(.regular)
                                Spacer()
                                
                                Text("4,35,804")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .fontWeight(.regular)
                            }
                        }
                        .padding()
                        
                    }
                    .background(Color("Custom_Gray_BG"))
                    .cornerRadius(30)
                   

                    // Exchange Button
                    Button(action: {
                        //
                    }) {
                        Text("Exchange")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Color_Tab_Bar"))
                            .cornerRadius(200)
                    }
                    .padding(.bottom,16)

                    // Summary Section
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Rate")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("1 ETH = ₹ 1,76,138.80")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Spread")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("0.2%")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Gas fee")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("₹ 422.73")
                                .foregroundColor(.gray)
                        }
                        
                        Divider().background(Color.gray.opacity(0.5))
                        
                        HStack {
                            Text("You will receive")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("₹ 1,75,716.07")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.top, 10)

                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal)
                .background(Color.black.ignoresSafeArea())
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    ExchangeView()
}
