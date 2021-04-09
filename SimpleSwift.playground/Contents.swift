print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
   if args.count == 1 {
       return 0
    }
    let length = args.count
    switch args.last {
    case "count" :
        return args.count - 1
    case "avg":
        var sum = 0
        var args2 = args
        args2.remove(at:length-1)
        for n in args2{
            sum += Int(n) ?? 0
        }
        return sum/(length-1)
    case "fact":
        let num = (Int(args[0]) ?? 0)
        return fact(num)
    default:
        let left = Int(args[0]) ?? 0
        let right = Int(args[2]) ?? 0
        switch args[1]{
        case "+":
            return left+right
        case "-":
            return left-right
        case "*":
            return left*right
        case "/":
            return left/right
        case"%":
            return left%right
        default: return -1
        }
    }
    //return -1
}

func calculate(_ arg: String) -> Int {
    let splited = arg.split(separator:  " ").map({ substr in String(substr) })
    
    return calculate(splited)
    //return -1
}

func fact(_ num: Int) -> Int {
    if num == 0 {
        return 1
    } else {
        return num * fact(num-1)
    }
}

let test = "2 + 2"
let splited = test.split(separator:  " ").map({ substr in String(substr) })


// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    if args.count == 1 {
        return 0
     }
     let length = args.count
     switch args.last {
     case "count" :
        return Double(args.count) - 1.0
     case "avg":
        var sum = 0.0
         var args2 = args
         args2.remove(at:length-1)
         for n in args2{
            sum += Double(n) ?? 0.0
         }
         return sum/Double((length-1))
     case "fact":
         let num = (Int(args[0]) ?? 0)
         return Double(fact(num))
     default:
        let left = Double(args[0]) ?? 0.0
        let right = Double(args[2]) ?? 0.0
         switch args[1]{
         case "+":
             return left+right
         case "-":
             return left-right
         case "*":
             return left*right
         case "/":
             return left/right
         case"%":
            return left.truncatingRemainder(dividingBy: right)
         default: return -1.0
         }
     }
     //return -1
}
func calculate(_ arg: String) -> Double {
    let splited = arg.split(separator:  " ").map({ substr in String(substr) })
    
    return calculate(splited)
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5

//edited 11:33
