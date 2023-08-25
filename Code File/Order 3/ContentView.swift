import SwiftUI
struct ContentView: View {
    @State var purchasePrice: Double = 500000.0 // default value of slider
    @State var downPayment: Double = 250000.0 // default value of slider
    @State var repaymentTime: Double = 15.0 // default value of slider
    @State var interestRate: Double = 10.0 // default value of slider
    @State var showLoanAmount: Bool = false
    @State var showMonthlyPayment: Bool = false
    var mortgageAmount: Double {
        let principal = purchasePrice - downPayment
        let monthlyInterestRate = interestRate / 1200
        let numberOfPayments = repaymentTime * 12
        let mortgage = (purchasePrice - downPayment) * (monthlyInterestRate * pow((1 + monthlyInterestRate), numberOfPayments)) / (pow((1 + monthlyInterestRate), numberOfPayments) - 1)
        return mortgage
    }
    
   
    var monthlyPayment: Double {
           return mortgageAmount / (repaymentTime * 12)
       }
    
    var body: some View {
        VStack {
            Text("Mortgage Calculator")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
                .bold()
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Purchase Price:")
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .bold()
                    
                    Text("$\(Int(purchasePrice))")
                        .fontWeight(.semibold)
                        .padding(.trailing)
                    
                    Spacer()
                }

                Slider(value: $purchasePrice, in: 0...1000000, step: 1000)
                    .padding()
                    .accentColor(.purple)
                    .frame(height: 50)
                
                HStack {
                    Text("Down Payment:")
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .bold()
                    
                    Text("$\(Int(downPayment))")
                        .fontWeight(.semibold)
                        .padding(.trailing)
                    
                    Spacer()
                }
                
                Slider(value: $downPayment, in: 0...500000, step: 1000)
                    .padding()
                    .accentColor(.purple)
                    .frame(height: 50)
                
                HStack {
                    Text("Repayment Time:")
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .bold()
                    
                    Text("\(Int(repaymentTime)) years")
                        .fontWeight(.semibold)
                        .padding(.trailing)
                    
                    Spacer()
                }
                
                Slider(value: $repaymentTime, in: 0...30, step: 1)
                    .padding()
                    .accentColor(.purple)
                    .frame(height: 50)
                
                HStack {
                    Text("Interest Rate:")
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .bold()
                    
                    Text("\(Int(interestRate))%")
                        .fontWeight(.semibold)
                        .padding(.trailing)
                    
                    Spacer()
                }
                
                Slider(value: $interestRate, in: 0...30, step: 0.25)
                    .padding()
                    .accentColor(.purple)
                    .frame(height: 50)
                
                HStack {
                    Text("Estimated pr. month:")
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .bold()
                        
                    if showLoanAmount {
                            Text("$\(Int(mortgageAmount))")
                                .fontWeight(.semibold)
                                .padding(.trailing)
                        } else
                        {
                            Text("-")
                            .fontWeight(.semibold)
                            .padding(.trailing)
                            }
                            
                    Spacer()
                }
                .padding(.bottom)
                
            }
            .padding(.bottom)
            .padding(.bottom)
            .padding(.bottom)
            
            Spacer()
            
            Button(action: {
                showLoanAmount = true
                showMonthlyPayment = true
                print("Get Mortgage Quote button pressed!")
            }, label: {
                Text("Get Mortgage Quote")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })
            .padding(.bottom)
        }
        .padding(.top)
        .padding(.top)
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




