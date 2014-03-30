require "base64"

email = "solife.jay@gmail.com"
pwd = "jay527130673"

n2 = email.length.to_s
n1 = n2.length.to_s

str = n1 + n2 + email + pwd
puts str
puts str = Base64.encode64(str)
puts str

str = Base64.decode64(str)
    n1 = str[0].to_i
    n2 = str[1..n1]
    str = str[n1+n2.length-1..str.length-1]
puts    email = str[0..n2.to_i-1]
puts    pwd   = str[n2.to_i..str.length-1]
