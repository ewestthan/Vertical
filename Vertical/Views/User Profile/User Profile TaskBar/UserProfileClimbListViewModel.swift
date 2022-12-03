//
//  UserProfileClimbListViewModel.swift
//  Vertical
//
//  Created by Ethan West on 12/3/22.
//

import SwiftUI

class UserProfileClimbListViewModel: ObservableObject {
    @Published var currentGrade: Int = 0
    
    
    func setGradeSeperator(newGrade: Int) -> AnyView{
        if(currentGrade != newGrade){
            self.currentGrade = newGrade
            return AnyView(UserProfileGradeRow(grade: newGrade))
        }
        else{
            return AnyView(EmptyView())
        }
    }
}
