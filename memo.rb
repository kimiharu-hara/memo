require "csv"
 
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
 
memo_type = gets.chomp.to_s

if memo_type == "1" then
   puts "拡張子を除いたファイル名を入力して下さい"
   fail_name = gets.chomp.to_s
   File.open("#{fail_name}.csv","w+") 
   p "メモしたい内容を記入して下さい"
   p "完了したらcontrolキー＋Dキーを押して下さい"
   memo_contents=[]  
   while line = gets
     memo_contents.push(line.chomp.to_s)
   end
   
   File.open("#{fail_name}.csv",'w+') do |csv|
         memo_contents.each{ |i|
          csv.print(i)
          csv.print(",")
         }
   end
   
   
elsif memo_type =="2" then
   puts "編集したい拡張子を除いたファイル名を入力して下さい"
   fail_name = gets.chomp.to_s
   p "メモしたい内容を記入して下さい"
   p "完了したらcontrolキー＋Dキーを押して下さい"
   
   p "ーーー編集前の内容ーーー"
    CSV.foreach("#{fail_name}.csv") do |line_ary|
       line_ary.pop
       line_ary.each do |line_contents|
          puts line_contents
       end
   end 
   p "ーーー編集前の内容ーーー"
   p "編集前の内容を変更する場合は１行づつコピペしてから編集して下さい"
   p "編集前の内容に追記する場合は全体をコピペしてから編集して下さい"
   
   memo_contents=[]  
   while line = gets
     memo_contents.push(line.chomp.to_s)
   end
   
   File.open("#{fail_name}.csv",'r+') do |csv|
         memo_contents.each{ |i|
          csv.print(i)
          csv.print(",")
         }
   end
 
end