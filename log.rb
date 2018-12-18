@arr = []
f = File.open('./commit.log', 'r')
f.each_line do |line|
  regx = line.match(/^(D,) \[(.*)\] DEBUG -- : \[(.*)\] \s* \((.*)ms\) \s* COMMIT/)
  @arr << {date: regx[2], uid: regx[3], ms: regx[4].to_i} if regx
end
f.close

@arr.sort_by! {|x| x[:ms] }.reverse!

puts @arr[0...10]
