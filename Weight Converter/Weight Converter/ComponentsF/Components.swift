import Foundation
import SwiftUI

// PickerSection for selecting the unit of weight
struct PickerSection: View {
    let title: String
    let units: [UnitMass]  // Changed to UnitMass for weight
    @Binding var selectedUnit: UnitMass
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .font(.callout)
                .foregroundColor(.gray)
            Picker(title, selection: $selectedUnit){
                ForEach(units, id:\.self){ unit in
                    Text(unit.symbol)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

// InputSection for entering weight value
struct InputSection: View {
    let title: String
    let placeholder: String
    @Binding var value: Double?
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.callout)
                .foregroundColor(.gray)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 40)
                TextField(placeholder, value: $value, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($isFocused)
                    .padding(.horizontal)
            }
        }
    }
}

// OutputSection to display the converted weight
struct OutputSection: View {
    let title: String
    let output: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.callout)
                .foregroundColor(.gray)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 40)
                Text(output)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
        }
    }
}

