//
//  StoryChapterContentView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

struct StoryChapterContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: StoryDayAndChapterView() GV 12/14/24
                Text("SubChapterTitle")
                    .font(.title)
                    .bold()
                
                // NOTE: Placeholder for chapter images
                Image("placeholder-image")
                    .resizable()
                    .scaledToFit()
                
                // NOTE: Placeholder for chapter narrative
                Text("""
                    Story Content Displayed Here:
                
                    Lorem ipsum odor amet, consectetuer adipiscing elit. Augue malesuada congue mi nulla ad. Malesuada auctor primis lacus semper quam eget fusce. Ante mollis hac himenaeos magnis ut ut cursus justo luctus. Penatibus curae sed convallis maecenas quam sit. Vulputate porttitor inceptos parturient donec etiam netus hendrerit faucibus. Himenaeos donec himenaeos nisi hac nam facilisis dapibus orci in. Nibh suscipit dictum consectetur per auctor justo.
                
                    Sollicitudin mi curabitur natoque ad; tempor elit. Aliquam vel massa interdum morbi bibendum; aliquam porttitor sem. Pellentesque risus elit duis; integer montes senectus sociosqu nam. Quam convallis class aenean praesent lobortis tellus porttitor. Cubilia eget amet congue viverra ut gravida. Fermentum venenatis nam senectus accumsan diam commodo sit. Justo rutrum risus diam vestibulum, cubilia arcu augue commodo aliquet. Placerat morbi libero parturient sapien orci lacinia.
                
                    Non nullam scelerisque sit aenean fermentum nulla ac. Sapien nunc massa odio; integer lacinia sollicitudin. Tincidunt mi torquent hendrerit eros natoque vulputate. Tristique platea morbi potenti consequat velit cursus luctus faucibus. Penatibus nam laoreet vel augue bibendum leo aliquet diam. Risus sem aptent habitant sed ullamcorper neque dis. Inceptos proin adipiscing maecenas erat himenaeos platea. Dictum amet scelerisque orci nisl nibh scelerisque ridiculus. Vehicula per proin curabitur senectus; justo dui egestas. Scelerisque class imperdiet pellentesque enim senectus parturient
                """)
                .font(.body)
                .padding()
                
                Spacer()
                
                // MARK: StoryDecisionButton() GV 12/15/24
                StoryDecisionButton()
            }
        }
    }
}

#Preview {
    StoryChapterContentView()
}
