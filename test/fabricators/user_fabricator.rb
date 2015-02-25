Fabricator(:user) do
  email           { sequence(:email) { |i| "dphaener+#{i}@gmail.com"} }
  first_name      "MyString"
  last_name       "MyString"
  password        "pa$$word5647389"
end
