//
//  ContentView.swift
//  Weatherapp
//
//  Created by Matthew Castaneda on 2/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8),
                Color.cyan.opacity(0.6),
                Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            VStack {
                Text("Chapel Hill")
                    .font(.title)
                    .foregroundColor(.white)
                Text("55°")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("Sunny")
                    .foregroundStyle(.white)
                HStack{
                    Text("H:57°")
                        .foregroundColor(.white)
                    Text("L:45°")
                        .foregroundColor(.white)
                }
                HourlyForecastView()
                WeeklyForecastView()
                
            }
        }
    
    }
        

}

struct HourlyForecastView: View{
    var body: some View{
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        gradient:Gradient(colors:[Color.blue.opacity(0.8),Color.cyan.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                        )
                )
                .frame(width:375,height:150)
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(Color(white:0.2))
                Text("Hourly Forecast")
                    .font(.headline)
                    .foregroundColor(Color(white:0.2))

            }
            .padding(9)
            HStack{
            
                HourlyRowView(time:"Now",condition:"sun.max.fill",temperature:"54°")
                
                HourlyRowView(time:"1PM",condition:"sun.max.fill",temperature:"56°")
                
                HourlyRowView(time:"2PM",condition:"sun.max.fill",temperature:"56°")
                
                HourlyRowView(time:"3PM",condition:"cloud.sun",temperature:"56°")
                
                HourlyRowView(time:"4PM",condition:"sun.horizon.fill",temperature:"56°")
                
                HourlyRowView(time:"5PM",condition:"sun.horizon",temperature:"56°")
            }
            .padding(50)
        
        }
    }
}

struct HourlyRowView: View{
        let time:String
        let condition:String
        let temperature:String
    var body: some View{
        
        VStack{
                Text(time)
                .font(.footnote)
                .foregroundColor(.white)
                Image(systemName: condition)
                    .foregroundColor(.yellow)
                Text(temperature)
                    .foregroundColor(.white)
                    .padding(5)
            }
        
        
    }
}

struct WeeklyForecastView: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient:Gradient(colors:[Color.blue.opacity(0.8),Color(white:0.9).opacity(0.6)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width:375,height:400)
            VStack{
                HStack{
                    Image(systemName: "calendar")
                        .foregroundColor(Color(white:0.2))
                    
                    Text("10-Day Forecast")
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color(white:0.2))
                    
                }
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.top,10)
                .padding(.leading,15)
                
                Spacer()
                ScrollView{
                    VStack(spacing:5){
                        WeeklyRowView(Day: "Today", condition: "cloud.fill", tempmin: "45°", tempmax: "60°")
                        
                        WeeklyRowView(Day: "Mon", condition: "cloud.snow.fill", tempmin: "54°", tempmax: "72°")
                        
                        WeeklyRowView(Day: "Tue", condition: "cloud.fill", tempmin: "60°", tempmax: "80°")
                        
                        WeeklyRowView(Day: "Wed", condition: "cloud.fill", tempmin: "42°", tempmax: "82°")
                        WeeklyRowView(Day: "Thu", condition: "cloud.fill", tempmin: "20°", tempmax: "100°")
                        WeeklyRowView(Day: "Wed", condition: "cloud.fill", tempmin: "60°", tempmax: "67°")
                        WeeklyRowView(Day: "Thu", condition: "cloud.fill", tempmin: "34°", tempmax: "72°")
                        WeeklyRowView(Day: "Thu", condition: "cloud.fill", tempmin: "50°", tempmax: "78°")
                        WeeklyRowView(Day: "Thu", condition: "cloud.fill", tempmin: "48°", tempmax: "62°")
                        WeeklyRowView(Day: "Thu", condition: "cloud.fill", tempmin: "25°", tempmax: "52°")}
                    
                }
                .padding(.top,10)
                
            }
            .padding(.horizontal,15)
        }
        .frame(width:375,height:400)
    }
}
struct WeeklyRowView: View{
    let Day:String
    let condition:String
    let tempmin:String
    let tempmax:String
    var body:some View{
        HStack{
            Text(Day)
                .foregroundStyle(.white)
            Image(systemName: condition)
                .foregroundStyle(.white)
            Text(tempmin)
                .foregroundStyle(.gray)
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(gradient: Gradient(colors:[Color.blue,Color.red]), startPoint: .leading, endPoint: .trailing)
                )
                .frame(height:8)
            Text(tempmax)
                .foregroundStyle(.white)
            
        }
        .padding()
        
    }
}
#Preview {
    ContentView()
}
