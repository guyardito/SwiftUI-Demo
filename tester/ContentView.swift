//
//  ContentView.swift
//  tester
//
//  Created by Guy Ardito on 7/9/19.
//  Copyright © 2019 Guy Ardito. All rights reserved.
//

import SwiftUI

struct ContentView : View {
	@State var flag = false
	
    var body: some View {
		HStack {
			Button(action: { self.flag.toggle() }) { Text("click") }
			if flag == true {
				Text("Hello World")
			}
		}
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
