import SwiftUI

struct WeightConverterView: View {
    @State private var inputValue: Double? = nil
    @State private var selectedUnitFrom: UnitMass = .kilograms
    @State private var selectedUnitTo: UnitMass = .pounds
    @State private var convertedValue: String = ""
    @FocusState private var isInputFocused: Bool
    
    let units: [UnitMass] = [.kilograms, .grams, .pounds, .ounces]  // Define weight units
    
    var body: some View {
        VStack(spacing: 20) {
            // Input Section
            InputSection(title: "Enter Weight", placeholder: "Weight", value: $inputValue, isFocused: $isInputFocused)
            
            // Picker for selecting units (From)
            PickerSection(title: "From Unit", units: units, selectedUnit: $selectedUnitFrom)
            
            // Picker for selecting units (To)
            PickerSection(title: "To Unit", units: units, selectedUnit: $selectedUnitTo)
            
            // Button to perform conversion
            Button(action: convertWeight) {
                Text("Convert")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            // Output Section to display result
            OutputSection(title: "Converted Weight", output: convertedValue)
        }
        .padding()
        .onChange(of: inputValue) { _ in
            convertWeight()  // Recalculate conversion when input changes
        }
        .onChange(of: selectedUnitFrom) { _ in
            convertWeight()  // Recalculate conversion when units change
        }
        .onChange(of: selectedUnitTo) { _ in
            convertWeight()  // Recalculate conversion when units change
        }
    }
    
    // Conversion Logic
    func convertWeight() {
        guard let value = inputValue else {
            convertedValue = "Please enter a valid weight"
            return
        }
        
        let fromUnit = selectedUnitFrom
        let toUnit = selectedUnitTo
        
        // Convert input value to the selected "from" unit
        let measurement = Measurement(value: value, unit: fromUnit)
        
        // Perform the conversion to the selected "to" unit
        let convertedMeasurement = measurement.converted(to: toUnit)
        
        // Format and display the result
        convertedValue = String(format: "%.2f", convertedMeasurement.value)
    }
}

#Preview {
    WeightConverterView()
}
