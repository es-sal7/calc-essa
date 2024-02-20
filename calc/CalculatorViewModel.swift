import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var displayValue = "0"
    private var runningNumber = 0
    private var currentOperation: Operation = .none
    
    func processInput(button: CalcButton) {
        switch button {
        case .add, .subtract, .mutliply, .divide, .equal:
            if button == .add {
                currentOperation = .add
                runningNumber = Int(displayValue) ?? 0
            } else if button == .subtract {
                currentOperation = .subtract
                runningNumber = Int(displayValue) ?? 0
            } else if button == .mutliply {
                currentOperation = .multiply
                runningNumber = Int(displayValue) ?? 0
            } else if button == .divide {
                currentOperation = .divide
                runningNumber = Int(displayValue) ?? 0
            } else if button == .equal {
                let currentValue = Int(displayValue) ?? 0
                switch currentOperation {
                case .add: displayValue = "\(runningNumber + currentValue)"
                case .subtract: displayValue = "\(runningNumber - currentValue)"
                case .multiply: displayValue = "\(runningNumber * currentValue)"
                case .divide: displayValue = "\(runningNumber / currentValue)"
                case .none: break
                }
            }
            
            if button != .equal {
                displayValue = "0"
            }
            
        case .clear:
            displayValue = "0"
            
        case .decimal:
            // Handle decimal logic here
            
        default:
            let number = button.rawValue
            if displayValue == "0" {
                displayValue = number
            } else {
                displayValue += number
            }
        }
    }
}
