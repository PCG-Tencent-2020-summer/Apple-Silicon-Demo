import Foundation

import Cocoa
import Foundation
import SceneKit


let X = [[0, 0, 1], [0, 1, 1], [1, 0, 1], [1, 1, 1]]
let y = [[0], [1], [1], [0]]


var w0 = randomMat(row: 3, col: 4)
var w1 = randomMat(row: 4, col: 1)



for i in 0 ... 500 {
    let l0 = matItoD(X)
    let l1 = sigmoid(x: matDot(l0, w0), deriv: false)
    let l2 = sigmoid(x: matDot(l1, w1), deriv: false)

    let l2_error = matSub(matItoD(y), l2)

    if i % 100 == 0 {
        print(matMean(matAbs(l2_error)))
    }

    let l2_delta = matElemDot(l2_error, sigmoid(x: l2, deriv: true))

    let l1_error = matDot(l2_delta, matT(w1))

    let l1_delta = matElemDot(l1_error, sigmoid(x: l1, deriv: true))
    //    w1 += l1.T.dot(l2_delta)
    w1 = matAdd(w1, matDot(matT(l1), l2_delta))
    //    w0 += l0.T.dot(l1_delta)
    w0 = matAdd(w0, matDot(matT(l0), l1_delta))
    print(w0)
//    print(w1)
}

