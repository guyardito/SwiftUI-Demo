//
//  Private.swift
//  tester
//
//  Created by Guy Ardito on 7/10/19.
//  Copyright © 2019 Guy Ardito. All rights reserved.
//

import SwiftUI

struct Private : View {
	@State var flag = false
	
	var body: some View {
		HStack {
			Button(action: { self.flag.toggle() }) { Text("click") }
			if flag == true {
				Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
			}
		}
	}
}

#if DEBUG
struct Private_Previews : PreviewProvider {
    static var previews: some View {
        Private()
    }
}
#endif
