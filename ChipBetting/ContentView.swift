//
//  ContentView.swift
//  ChipBetting
//
//  Created by HanGyeongjun on 2022/12/25.
//

import SwiftUI

struct ContentView: View {
    
    //플레이어 초기 칩 개수
    @State var firstPlayer: Int = 30
    @State var secondPlayer: Int = 30
    @State var thirdPlayer: Int = 30
    @State var fourthPlayer: Int = 30
    //칩 베팅 변수
    @State var mainBet: Int = 0
    //베팅모드
    @State var isBettingMode: Bool = true
    @State var isChipSettingMode: Bool = false
    //칩 개수 슬라이더
    @State var sliderValue = 30.0
    let minValue = 10.0
    let maxValue = 100.0
    //리셋 알럿
    @State var showingAlert: Bool = false
    
    var body: some View {
        VStack {
            //칩 개수 세팅 및 리셋 버튼
            HStack(spacing: 100) {
                Button() {
                    if isChipSettingMode {
                        isChipSettingMode.toggle()
                        firstPlayer = Int(sliderValue)
                        secondPlayer = Int(sliderValue)
                        thirdPlayer = Int(sliderValue)
                        fourthPlayer = Int(sliderValue)
                        
                    } else {
                        isChipSettingMode.toggle()
                    }
                } label: {
                    Text(isChipSettingMode ? "개수 세팅 완료" : "칩 개수 세팅")
                }
                
                Button() {
                    showingAlert.toggle()
                } label: {
                    Text("리셋")
                }
                .alert("칩 리셋", isPresented: $showingAlert) {
                    Button("리셋", role: .destructive) {
                        firstPlayer = 30
                        secondPlayer = 30
                        thirdPlayer = 30
                        fourthPlayer = 30
                        mainBet = 0
                    }
                } message: {
                    Text("칩 상태를 모두 리셋하시겠습니까?")
                }
            }
            
            //slider 표시
            if isChipSettingMode {
                HStack(spacing: 20) {
                    Text("\(Int(sliderValue))개")
                        .font(.title)
                    Slider(value: $sliderValue, in: minValue...maxValue)
                }
                .padding(.horizontal, 60)
            }
            
            //각 플레이어 상태 및 베팅 버튼
            HStack {
                VStack(spacing: 10) {
                    Text("1번 플레이어")
                    
                    HStack {
                        Text("남은 칩")
                        Text("\(firstPlayer)")
                            .font(.title)
                        Text("개")
                    }
                    .foregroundColor(Color.blue)
                    
                    Button() {
                        firstPlayer -= 1
                        mainBet += 1
                    } label: {
                        Text("+1 베팅")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    Button() {
                        firstPlayer += 1
                        mainBet -= 1
                    } label: {
                        Text("베팅 -1")
                            .foregroundColor(Color.blue)
                    }
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("2번 플레이어")
                    
                    HStack {
                        Text("남은 칩")
                        Text("\(secondPlayer)")
                            .font(.title)
                        Text("개")
                    }
                    .foregroundColor(Color.red)
                    
                    Button() {
                        secondPlayer -= 1
                        mainBet += 1
                    } label: {
                        Text("+1 베팅")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                    Button() {
                        secondPlayer += 1
                        mainBet -= 1
                    } label: {
                        Text("베팅 -1")
                            .foregroundColor(Color.red)
                    }
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("3번 플레이어")
                    
                    HStack {
                        Text("남은 칩")
                        Text("\(thirdPlayer)")
                            .font(.title)
                        Text("개")
                    }
                    .foregroundColor(Color.green)
                    
                    Button() {
                        thirdPlayer -= 1
                        mainBet += 1
                    } label: {
                        Text("+1 베팅")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.green)
                            .cornerRadius(12)
                    }
                    Button() {
                        thirdPlayer += 1
                        mainBet -= 1
                    } label: {
                        Text("베팅 -1")
                            .foregroundColor(Color.green)
                    }
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("4번 플레이어")
                    
                    HStack {
                        Text("남은 칩")
                        Text("\(fourthPlayer)")
                            .font(.title)
                        Text("개")
                    }
                    .foregroundColor(Color.purple)
                    
                    Button() {
                        fourthPlayer -= 1
                        mainBet += 1
                    } label: {
                        Text("+1 베팅")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    Button() {
                        fourthPlayer += 1
                        mainBet -= 1
                    } label: {
                        Text("베팅 -1")
                            .foregroundColor(Color.purple)
                    }
                }
            }
            .padding(.vertical, 60)
            .padding(.horizontal, 200)
            
            //현재 베팅 칩 개수
            Text("현재 베팅 \(mainBet) 개")
                .font(.largeTitle)
                .padding(.bottom, 40)
            
            //베팅 완료 및 승리 플레이어 선택 Hstack
            if isBettingMode {
                HStack {
                    Button() {
                        firstPlayer -= 1
                        secondPlayer -= 1
                        thirdPlayer -= 1
                        fourthPlayer -= 1
                        mainBet += 3
                    } label: {
                        Text("일괄베팅")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding(.all, 40)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    Spacer()
                        .frame(width: 20)
                    Button() {
                        isBettingMode.toggle()
                    } label: {
                        Text("베팅완료")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding(.all, 40)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                }
            } else {
                HStack(spacing: 40) {
                    Button() {
                        firstPlayer += mainBet
                        mainBet = 0
                    } label: {
                        Text("1번 승리")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    
                    Button() {
                        secondPlayer += mainBet
                        mainBet = 0
                    } label: {
                        Text("2번 승리")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                    
                    Button() {
                        thirdPlayer += mainBet
                        mainBet = 0
                    } label: {
                        Text("3번 승리")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.green)
                            .cornerRadius(12)
                    }
                    
                    Button() {
                        fourthPlayer += mainBet
                        mainBet = 0
                    } label: {
                        Text("4번 승리")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    
                    Button() {
                        isBettingMode.toggle()
                    } label: {
                        Text("턴 종료")
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .background(Color.black)
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
