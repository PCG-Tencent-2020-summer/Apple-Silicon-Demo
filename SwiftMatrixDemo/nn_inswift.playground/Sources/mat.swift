import Foundation
import Cocoa

public func newMat(row: Int, col: Int, initNum: Double) -> [[Double]] {
    return [[Double]](repeating: [Double](repeating: initNum, count: col), count: row)
}

public func matItoD(_ x: [[Int]]) -> [[Double]] {
    var array = newMat(row: x.count, col: x[0].count, initNum: 0)
    for i in 0 ... x.count-1 {
        for j in 0 ... x[0].count - 1 {
            array[i][j] = Double(x[i][j])
        }
    }
    return array
}

public func randomArr(len: Int) -> [Double] {
    var array = [Double]()
    for _ in 0 ... len-1 {
        array.append(Double.random(in: -1.0 ... 1.0))
    }
    return array
}


public func randomMat(row: Int, col: Int) -> [[Double]] {
    var array = [[Double]]()
    for _ in 0 ... row-1 {
        var rowArray = [Double]()
        rowArray = randomArr(len: col)
        array.append(rowArray)
    }
    return array
}


public func matAdd(_ x: [[Double]], _ y: [[Double]]) -> [[Double]] {
    var array = newMat(row: x.count, col: x[0].count, initNum: 0)
    for i in 0 ... x.count-1{
        for j in 0 ... x[0].count-1{
            array[i][j] = x[i][j] + y[i][j]
        }
    }
    return array
}


public func matSub(_ x: [[Double]], _ y: [[Double]]) -> [[Double]] {
    var array = newMat(row: x.count, col: x[0].count, initNum: 0)
    for i in 0 ... x.count-1{
        for j in 0 ... x[0].count-1{
            array[i][j] = x[i][j] - y[i][j]
        }
    }
    return array
}


public func matDot(_ x: [[Double]], _ y: [[Double]]) -> [[Double]] {
    var array = newMat(row: x.count, col: y[0].count, initNum: 0)
    for i in 0 ... x.count-1{
        for k in 0 ... y[0].count-1 {
            for j in 0 ... x[0].count-1 {
                array[i][k] += x[i][j] * y[j][k]
            }
        }
    }
    return array
}


public func matElemDot(_ x: [[Double]], _ y: [[Double]]) -> [[Double]] {
    var array = newMat(row: x.count, col: x[0].count, initNum: 0)
    for i in 0 ... x.count-1{
        for j in 0 ... x[0].count-1 {
            array[i][j] = x[i][j] * y[i][j]
        }
    }
    return array
}


public func matDiv(_ x: [[Double]], _ y: [[Double]]) -> [[Double]] {
    var array = newMat(row: x.count, col: x[0].count, initNum: 0)
    for i in 0 ... x.count-1 {
        for j in 0 ... x[0].count-1 {
            array[i][j] = x[i][j] / y[i][j]
        }
    }
    return array
}

public func matExp(_ x: [[Double]]) -> [[Double]] {
    var array = newMat(row: x.count, col: x[0].count, initNum: 0)
    for i in 0 ... x.count-1 {
        for j in 0 ... x[0].count - 1 {
            array[i][j] = pow(M_E, Double(x[i][j]))
        }
    }
    return array
}


public func matNeg(_ x: [[Double]]) -> [[Double]] {
    var array = newMat(row: x.count, col: x[0].count, initNum: 0)
    for i in 0 ... x.count-1 {
        for j in 0 ... x[0].count - 1 {
            array[i][j] = -Double(x[i][j])
        }
    }
    return array
}

public func matAbs(_ x: [[Double]]) -> [[Double]] {
    var array = newMat(row: x.count, col: x[0].count, initNum: 0)
    for i in 0 ... x.count-1 {
        for j in 0 ... x[0].count - 1 {
            array[i][j] = x[i][j] < 0 ? -x[i][j] : x[i][j]
        }
    }
    return array
}

public func matMean(_ x: [[Double]]) -> Double {
    var sum: Double = 0
    for i in 0 ... x.count-1 {
        for j in 0 ... x[0].count - 1 {
            sum += x[i][j]
        }
    }
    sum = sum / Double(x.count * x[0].count)
    return sum
}

public func matT(_ x: [[Double]]) -> [[Double]] {
    var array = newMat(row: x[0].count, col: x.count, initNum: 0)
    for i in 0 ... x.count-1 {
        for j in 0 ... x[0].count - 1 {
            array[j][i] = x[i][j]
        }
    }
    return array
}

public func sigmoid(x: [[Double]], deriv: Bool) -> [[Double]] {
    let mat_one = newMat(row: x.count, col: x[0].count, initNum: 1.0)
    if deriv == true {
        //return x * (1 - x)
        return matElemDot(x, matSub(mat_one, x))
    }else {
        //return 1 / (1 + np.exp(-x))
        return matDiv(mat_one, matAdd(mat_one, matExp(matNeg(x))))
    }
}
