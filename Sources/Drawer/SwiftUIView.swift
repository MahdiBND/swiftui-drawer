//
//  SwiftUIView.swift
//  
//
//  Created by Michael Verges on 7/20/20.
//

import SwiftUI

#if DEBUG

struct ContentView: View {
	@State var point = SnapPoint.bottom
	
	var body: some View {
		Drawer {
			ZStack(alignment: .top) {
				switch point {
					case .bottom: Color.blue.edgesIgnoringSafeArea(.all).animation(.spring())
					case .middle: Color.green.edgesIgnoringSafeArea(.all)
					default: Color.pink.edgesIgnoringSafeArea(.all)
				}
				
				Text("\(point.value)")
					.padding()
			}
		}
		.snap(at: [.bottom, .middle, .top])
		.onSnap { point in self.point = point }
		.edgesIgnoringSafeArea(.vertical)
	}
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
