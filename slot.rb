##スロットの結果を表示するメソッド(ポイントと残りコインが戻り値)
def slot_result(line,number,play_coin,rest_coin,point)
puts "おめでとう！#{line}に#{number}が揃いました！"
puts "#{play_coin * 10}コイン獲得しました"
puts "#{play_coin * 50}ポイント獲得しました"
puts "------------------"
point += play_coin * 50
rest_coin += play_coin * 10
##数字が増減するポイントと残りコインを戻り値で返す
return point,rest_coin
end

##初期化
rest_coin = 300
play_coin = 0
point = 0
line = ""
playing = true

##ゲーム終了するまでループする(0~3以外を押した際も)
while playing == true    
puts "残りコイン数" + rest_coin.to_s
puts "ポイント" + point.to_s
puts "何コイン入れますか？"
puts "1(10コイン) 2(30コイン) 3(50コイン) 4(やめとく)"
puts "----------------"

##使用コインを取得して残りコインからマイナスする
play_coin_number = gets.to_i
if play_coin_number == 1
rest_coin -= 10
play_coin = 10
elsif play_coin_number == 2
rest_coin -= 30
play_coin = 30
elsif play_coin_number == 3
rest_coin -= 50
play_coin = 50
elsif play_coin_number == 4
puts "結果は#{point}ポイントでした！！"
puts "------------------"
exit
else
##スロットを省略する(trueでスロットが回る)
playing = false
puts "0~3の数字を入力してください!!"
end

##スロット開始
if playing == true
puts "Enterを３回押してください"

##0~7の乱数生成
num1 = rand(7)
num2 = rand(7)
num3 = rand(7)
num4 = rand(7)
num5 = rand(7)
num6 = rand(7)
num7 = rand(7)
num8 = rand(7)
num9 = rand(7)

##スロット画面
gets 
    puts "------------------- "
    puts "|#{num1}| | |"
    puts "|#{num2}| | |"
    puts "|#{num3}| | |"
    puts "--------------------"
    gets 
    puts "------------------- "
    puts "|#{num1}|#{num4}| |"
    puts "|#{num2}|#{num5}| |"
    puts "|#{num3}|#{num6}| |"
    puts "--------------------"
    gets 
    puts "------------------- "
    puts "|#{num1}|#{num4}|#{num7}|"
    puts "|#{num2}|#{num5}|#{num8}|"
    puts "|#{num3}|#{num6}|#{num9}|"
    puts "--------------------"


##揃ったか判定し、揃ってた場合はメソッドを呼び出しポイントと残りコインにプラスする(メソッドの戻り値(point,restcoin))
if num1 == num2 && num2 == num3
point,rest_coin = slot_result("左",num1,play_coin,rest_coin,point)
elsif num4 == num5 && num5 == num6
point,rest_coin = slot_result("真ん中縦",num1,play_coin,rest_coin,point)
elsif num7 == num8 && num8 == num9
point,rest_coin = slot_result("右",num1,play_coin,rest_coin,point)
elsif num1 == num4 && num4 == num7
point,rest_coin = slot_result("上",num1,play_coin,rest_coin,point)
elsif num2 == num5 && num5 == num8
point,rest_coin = slot_result("真ん中横",num1,play_coin,rest_coin,point)
elsif num3 == num6 && num6 == num9
point,rest_coin = slot_result("下",num1,play_coin,rest_coin,point)
elsif num1 == num5 && num5 == num9
point,rest_coin = slot_result("右斜め下",num1,play_coin,rest_coin,point)
elsif num3 == num5 && num5 == num7
point,rest_coin = slot_result("右斜め上",num1,play_coin,rest_coin,point)
end

##0になったら終了
if rest_coin <= 0 
puts "所持コインが0になったのでゲーム終了です"
exit
end
end

##0~3以外を押した時。スロットを省略する(playingがfalseの時)
playing = true

end ##while
