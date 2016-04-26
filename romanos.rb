


def to_roman(num)

	clave = {1 => "I", 2 => "II", 3 => "III", 4 => "IV", 5 => "V", 6 => "VI", 7 => "VII", 8 => "VIII", 9 => "IX", 10 => "X",
	 20 => "XX", 30 => "XXX", 40 => "XL", 50 => "L", 60 => "LX", 70 => "LXX", 80 => "LXXX", 90 => "XC",
	 100 => "C", 200 => "CC", 300 => "CCC", 400 => "CD", 500 => "D", 600 => "DC", 700 => "DCC", 800 => "DCC", 900 => "CM",
	 1000 => "M", 2000 => "MM", 3000 => "MMM", 3000 => "MMM", 4000 => "-IV-", 5000 => "-V-", 6000 => "-VI-", 7000 => "-VII-",
	 8000 => "-VIII-", 9000 => "-IX-"
	}
	
	n_string = num.to_s
	romano = ""

	if n_string.length == 1
		romano = clave[num] 
	elsif n_string.length == 2
		if n_string[1] == "0"
				romano = clave[num]
		else
			a = n_string[0] + "0"
			romano = clave [a.to_i] + clave[n_string[1].to_i]
		end
	elsif n_string.length == 3
		if n_string[1].to_i != 0
			primer = n_string[0] + "00"
			romano = clave[primer.to_i]
			if n_string[2] == "0"
				romano += clave[n_string[1..2].to_i]
			else
				segundo = n_string[1] + "0"
				romano += clave[segundo.to_i] + clave[n_string[2].to_i]
			end
		elsif n_string[2] == "0"
			romano = clave[num]
		elsif n_string[1] == "0"
			decena = n_string[0] + "00"
			romano = clave[decena.to_i] + clave[n_string[2].to_i]
		end
	elsif n_string.length == 4
		if n_string[1..3] == "000"
			romano = clave[num]
		elsif n_string[1..2] == "00" && n_string[3].to_i != 0
			romano = clave[(n_string[0] + "000").to_i] + clave[n_string[3].to_i]
		elsif n_string[1] == "0" && n_string[2].to_i != 0 
			if n_string[3] == "0"
				romano = clave[(n_string[0] + "000").to_i] + clave[(n_string[2] + "0").to_i]
			elsif n_string[3] != 0
				romano = clave[(n_string[0] + "000").to_i] + clave[(n_string[2] + "0").to_i] + clave[n_string[3].to_i]
			end
		elsif n_string[1].to_i != 0
			if n_string[2..3] == "00"
				romano = clave[(n_string[0] + "000").to_i] + clave[(n_string[1] + "00").to_i] 
			elsif n_string[3] == "0"
				romano = clave[(n_string[0] + "000").to_i] + clave[(n_string[1] + "00").to_i] + clave[(n_string[2] + "0").to_i]
			elsif n_string[3].to_i != 0
				romano = clave[(n_string[0] + "000").to_i] + clave[(n_string[1] + "00").to_i]  + clave[(n_string[2] + "0").to_i] + clave[n_string[3].to_i]
			end
		end
	end
 romano
end




a = to_roman(1) == "I"
b = to_roman(3) == "III"  
c = to_roman(4) == "IV"
d = to_roman(9) == "IX"
e = to_roman(13) == "XIII"
f = to_roman(14) == "XIV"
g = to_roman(944) == "CMXLIV"
h = to_roman(1453) == "MCDLIII"
i = to_roman(1646) == "MDCXLVI"


puts "|valid |input | expected | actual"
puts "|------|------|----------|-------"
puts "| #{a} |1     | I        | #{to_roman(1)}"
puts "| #{b} |3     | III      | #{to_roman(3)}"
puts "| #{c} |4     | IV       | #{to_roman(4)}"
puts "| #{d} |9     | IX       | #{to_roman(9)}"
puts "| #{e} |13    | XIII     | #{to_roman(13)}"
puts "| #{f} |14    | XIV      | #{to_roman(14)}"
puts "| #{g} |944   | CMXLIV   | #{to_roman(944)}"
puts "| #{h} |1453  | MCDLIII  | #{to_roman(1453)}"
puts "| #{i} |1646  | MDCXLVI  | #{to_roman(1646)}" 

p to_roman(4000)
p to_roman(5000)
p to_roman(6000)
p to_roman(7000)
p to_roman(8000)
p to_roman(9000)
p to_roman(9999)