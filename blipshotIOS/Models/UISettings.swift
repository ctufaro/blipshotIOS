import Foundation
import Combine
import SwiftUI

class UISettings: ObservableObject {
    let objectWillChange = PassthroughSubject<UISettings,Never>()
    
    var showToolBar : Bool = true {
        didSet{
            //withAnimation() {
                objectWillChange.send(self)
            //}
        }
    }
    
    var showTopNav : Bool = true {
        didSet{
            //withAnimation() {
                objectWillChange.send(self)
            //}
        }
    }
    
    var currentPage : String = "home" {
        didSet{
            //withAnimation() {
                objectWillChange.send(self)
            //}
        }
    }

    func toggleView(){
        showToolBar = !showToolBar
    }
}
