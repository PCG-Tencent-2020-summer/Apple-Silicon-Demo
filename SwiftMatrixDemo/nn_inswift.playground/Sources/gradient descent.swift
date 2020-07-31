import PlaygroundSupport
import Foundation

// y = x ^ 2 + 1


//原函数
public func func_1d(x: Double) -> Double {
    return pow(x, 2) + 1
}

//求导
public func grad_1d(x: Double) -> Double {
    return x * 2
}

public var cur_x: Double = 10
public var learning_rate: Double = 0.2
public var precision: Double = 0.000001
public var max_iters: Int = 10000

public func gradient_descent() {
    for i in 0..<max_iters {
        
        var grad_cur = grad_1d(x: cur_x)
        if abs(grad_cur) < precision {
            // 当梯度趋近为 0 时，视为收敛
            break
        }
        cur_x = cur_x - grad_cur * learning_rate
        
        print("第", i, "次迭代：x 值为 ", cur_x)
    }
    
    print("局部最小值 x =", cur_x)
}

//gradient_descent()
