require "csv"

while true
  puts "1(新規でメモを作成) 2(既存のメモ編集する)"
 
  memo_type = gets.to_s.chomp

  if memo_type == "1"
    puts "メモを作成します。タイトルを入力してください。"
    title = gets.chomp
    puts "メモの内容を入力してください。Ctrl+Dで保存します。"
    imput_memo = STDIN.read
    memo = imput_memo.chomp
    
    CSV.open("#{title}.csv" ,"w") do |csv|
      csv.puts ["#{memo}"]
    end
    
  elsif memo_type == "2"
    puts "既存メモに追記します。編集するメモのタイトルを入力してください。"
    title = gets.chomp
    puts "メモの内容を入力してください。Ctrl+Dで保存します。"
    imput_memo = STDIN.read
    memo = imput_memo.chomp
    
    CSV.open("#{title}.csv" ,"a") do |csv|
      csv.puts ["#{memo}"]
    end
    
  else
    puts "１か２を入力してください。"
  end
end