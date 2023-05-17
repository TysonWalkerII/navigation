//
//  DDRArrows.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/17/23.
//

import Foundation
import SwiftUI



struct DDRArrow: View {
    @ObservedObject var vm: ViewModel
    let direction: Direction
    var body: some View {
        ZStack {
            switch direction {
            case .forward:
                Button {
                    vm.move(direction)
                } label: {
                    ForwardArrow()
                }
            case .backward:
                Button {
                    vm.move(direction)
                } label: {
                    BackwardArrow()
                }
            case .left:
                Button {
                    vm.move(direction)
                } label: {
                    LeftArrow()
                }
            case .right:
                Button {
                    vm.move(direction)
                } label: {
                    RightArrow()
                }
            }
        }
    }
}

struct ForwardArrow: View {
    var body: some View {
        Image("ddr arrow")
            .resizable()
            .frame(width:60,height:60)
    }
}

struct BackwardArrow: View {
    var body: some View {
        Image("ddr arrow")
            .resizable()
            .frame(width:60,height:60)
            .rotationEffect(.degrees(180))
    }
}

struct LeftArrow: View {
    var body: some View {
        Image("ddr arrow")
            .resizable()
            .frame(width:60,height:60)
            .rotationEffect(.degrees(-90))
    }
}

struct RightArrow: View {
    var body: some View {
        Image("ddr arrow")
            .resizable()
            .frame(width:60,height:60)
            .rotationEffect(.degrees(90))
    }
}


