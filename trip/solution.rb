# Enter your code here. Read input from STDIN. Print output to STDOUT

def expense_calculator(friends)
    num_friends = friends.length.to_f
    average = 1.to_f
    friends = friends.map!{|f| f.to_f}
    formatted_friends = friends.map{|f| f * 100.00}
    average = formatted_friends.reduce{|sum, item| sum+= item.to_f} 
    average = (average / num_friends).round / 100.0
    friends.sort!
    total_money =0.0
    while(friends[num_friends - 1] - friends[0] > 0.01)
        lowest_to_average = (average - friends[0]).to_f
        highest_to_average = (friends[num_friends - 1] - average).to_f
        money_changed = lowest_to_average < highest_to_average ? lowest_to_average : highest_to_average
        friends[0] = friends[0] + money_changed
        friends[num_friends - 1] = friends[num_friends - 1] - money_changed
        total_money+= money_changed.to_f
        friends.sort!
    end
    puts "$%.2f"%total_money
end


lines = ARGF.readlines.each{|line| line.chomp!}
while true
    num_items = lines[0].to_i
    items = lines[1,num_items]
    expense_calculator(items)
    lines = lines.drop(num_items + 1)
    break if lines[0] == "0"
end