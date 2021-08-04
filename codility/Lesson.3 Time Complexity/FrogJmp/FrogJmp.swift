import Foundation

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    return (Y-X)%D == 0 ? (Y-X)/D : (Y-X)/D+1
}
