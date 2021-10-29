import Foundation
import UIKit

extension UIView{
    func addsubViews(_ view: [UIView]){
        view.forEach {self.addSubview($0)}
    }
}
