//
//  StoryView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/9/24.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            // MARK: Navigation Icon Section
            HStack {
                // Navigation icons
                Button(action: {
                    // Navigate back to DashboardView()
                }) {
                    Image(systemName: "house.fill")
                        .font(.title2)
                        .padding()
                }
                Spacer()
                HStack(spacing: 20) {
                    Button(action: {
                        // Navigate to StoryAchievementsView()
                    }) {
                        Image(systemName: "star.fill")
                            .font(.title2)
                    }
                    Button(action: {
                        // Navigate to StoryMapView()
                    }) {
                        Image(systemName: "map.fill")
                            .font(.title2)
                    }
                }
                .padding()
            }
            
            // MARK: Player Stats Section
            HStack {
                HStack(spacing: 5) {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                    // NOTE: Placeholder for dynamic HP
                    Text("10 / 10")
                        .font(.headline)
                }
                Spacer()
                HStack(spacing: 5) {
                    Image(systemName: "bolt.fill")
                        .foregroundStyle(.blue)
                    // NOTE: Placeholder for dynamic EP
                    Text("10 / 10")
                        .font(.headline)
                }
                Spacer()
                // NOTE: Placeholder for dynamic story day
                Text("Day 1 out of 10")
                    .font(.headline)
            }
            .padding([.leading, .trailing])
            
            Divider()
                .padding(.vertical, 10)
            
            // MARK: Main Content
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: StoryDayAndChapterView() GV 12/14/24
                    StoryDayAndChapterView(
                        storyDay: 1,
                        storyTotalDays: 10,
                        storyChapter: "A New Beginning"
                    )
                    
                    // NOTE: Placeholder for chapter images
                    Image("placeholder-image")
                        .resizable()
                        .scaledToFit()
                     
                    // NOTE: Placeholder for chapter narrative
                    Text("""
                         Lorem ipsum odor amet, consectetuer adipiscing elit. Augue malesuada congue mi nulla ad. Malesuada auctor primis lacus semper quam eget fusce. Ante mollis hac himenaeos magnis ut ut cursus justo luctus. Penatibus curae sed convallis maecenas quam sit. Vulputate porttitor inceptos parturient donec etiam netus hendrerit faucibus. Himenaeos donec himenaeos nisi hac nam facilisis dapibus orci in. Nibh suscipit dictum consectetur per auctor justo.

                         Sollicitudin mi curabitur natoque ad; tempor elit. Aliquam vel massa interdum morbi bibendum; aliquam porttitor sem. Pellentesque risus elit duis; integer montes senectus sociosqu nam. Quam convallis class aenean praesent lobortis tellus porttitor. Cubilia eget amet congue viverra ut gravida. Fermentum venenatis nam senectus accumsan diam commodo sit. Justo rutrum risus diam vestibulum, cubilia arcu augue commodo aliquet. Placerat morbi libero parturient sapien orci lacinia.
                    """)
                    .font(.body)
                    .padding()
                    
                    Spacer()
                    
                    // NOTE: Decision Buttons
                    VStack(spacing: 10) {
                        Button(action: {
                            // Option 1 Action
                        }) {
                            Text("Option 1")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        Button(action: {
                            // Option 2 Action
                        }) {
                            Text("Option 2")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryView()
}
