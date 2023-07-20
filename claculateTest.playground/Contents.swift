// MARK: - Lv.1 , Lv.2
class Calculator {
    func calculate(operators: String, firstNumber: Double, secondNumber: Double) -> Double {
        //구현부
        if operators == "+"{
            return firstNumber + secondNumber
        }else if operators == "-"{
            return firstNumber - secondNumber
        }else if operators == "/"{
            return firstNumber / secondNumber
        }else if operators == "*"{
            return firstNumber * secondNumber
        }else if operators == "나머지"{
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
        }
        // 정확한 operator가 전달되지 않을 시 0을 리턴(nil을 리턴해도 됨)
        return 0
    }
}
let calculator = Calculator()
let addResult = Calculator().calculate(operators: "+", firstNumber: 1.0, secondNumber: 2.0)// 덧셈 연산
let subtractResult = Calculator().calculate(operators: "-", firstNumber: 1.0, secondNumber: 2.0)// 뺄셈 연산
let multiplyResult = Calculator().calculate(operators: "*", firstNumber: 1.0, secondNumber: 2.0)// 곱셈 연산
let divideResult = Calculator().calculate(operators: "/", firstNumber: 1.0, secondNumber: 2.0)// 나눗셈 연산
let remainderResult = Calculator().calculate(operators: "나머지", firstNumber: 3, secondNumber: 2)// 나머지 연산


print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")



// MARK: - Lv.3


class CalculatorLv3 {
    //프로퍼티 초기화
    
    var operators : String
    var firstNumber : Double
    var secondNumber : Double
    
    init(operators: String, firstNumber: Double,secondNumber:Double ) {
        self.operators = operators
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    func calculate(operators: String, firstNumber: Double,secondNumber:Double ) -> Double {
        //operator에 따라 프로퍼티의 함수를 실행
        // 정확한 operator가 전달되지 않을 시 0을 리턴(nil을 리턴해도 됨)
        if operators == "+"{
            return AddOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        }else if operators == "-"{
            return SubtractOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        }else if operators == "*"{
            return MultiplyOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        }else if operators == "/"{
            return DivideOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        }
        
        
        
        
        return 0
    }
}

class AddOperation {
    func operate(firstNumber: Double,secondNumber: Double) -> Double {
        return  firstNumber + secondNumber
    }
}

class SubtractOperation {
    func operate(firstNumber: Double,secondNumber: Double) -> Double {
        return  firstNumber - secondNumber
    }
}
class MultiplyOperation {
    func operate(firstNumber: Double,secondNumber: Double) -> Double {
        return  firstNumber * secondNumber
    }
}
class DivideOperation {
    func operate(firstNumber: Double,secondNumber: Double) -> Double {
        return  firstNumber / secondNumber
    }
}

let calculatorOne = CalculatorLv3(operators: "+", firstNumber: 3, secondNumber: 2)
let calculatorTwo = CalculatorLv3(operators: "-", firstNumber: 3, secondNumber: 2)
let calculatorThree = CalculatorLv3(operators: "/", firstNumber: 3, secondNumber: 2)
let calculatorFour = CalculatorLv3(operators: "*", firstNumber: 3, secondNumber: 2)

// 프로퍼티 초기화


let addResultLv3 = calculatorOne.calculate(operators: calculatorOne.operators, firstNumber: calculatorOne.firstNumber, secondNumber: calculatorOne.secondNumber)// 덧셈 연산
let subtractResultLv3 = calculatorTwo.calculate(operators: calculatorTwo.operators, firstNumber: calculatorTwo.firstNumber, secondNumber: calculatorTwo.secondNumber)// 뺄셈 연산
let multiplyResultLv3 = calculatorThree.calculate(operators: calculatorThree.operators, firstNumber: calculatorThree.firstNumber, secondNumber: calculatorThree.secondNumber)// 곱셈 연산
let divideResultLv3 = calculatorFour.calculate(operators: calculatorFour.operators, firstNumber: calculatorFour.firstNumber, secondNumber: calculatorFour.secondNumber)// 나눗셈 연산

print("addResult : \(addResultLv3)")
print("subtractResult : \(subtractResultLv3)")
print("multiplyResult : \(multiplyResultLv3)")
print("divideResult : \(divideResultLv3)")

// MARK: - Lv.4

class AbstractOperation {
    
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        // 기본적으로 아무런 연산도 하지않습니다.
        return 0
    }
    
}

class AddOperationLv4: AbstractOperation {
    
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
    
}

class SubtractOperationLv4: AbstractOperation {
    
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
    
}

class MultiplyOperationLv4: AbstractOperation {
    
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
    
}

class DivideOperationLv4: AbstractOperation {
    
    override func operate(firstNumber: Double, secondNumber: Double) -> Double {
        if secondNumber != 0 {
            return firstNumber / secondNumber
        } else {
            // 0으로 나누는 경우 에러 처리
            return 0
        }
    }
    
}

class CalculatorLv4{
    
    func calculate(operation: AbstractOperation, firstNumber: Double, secondNumber: Double) -> Double {
        return operation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
    }
    
}

let calculatorLv4 = CalculatorLv4()

let addOperation = AddOperationLv4()

let addResultLv4 = calculatorLv4.calculate(operation: addOperation, firstNumber: 5, secondNumber: 3)

print("addResult : \(addResult)")
