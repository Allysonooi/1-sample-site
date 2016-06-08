# ADMIN
email = 'ivan@33digital.io'
password = 'password'
a = Admin.find_or_initialize_by(email: email)
a.password = password
a.save!

# ADMIN
email = 'allyson@33digital.io'
password = 'password'
a = Admin.find_or_initialize_by(email: email)
a.password = password
a.save!
