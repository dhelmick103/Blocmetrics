admin = User.new(
  name: 'Admin User',
  email: 'dhelmick103@gmail.com',
  password: 'password1')
admin.skip_confirmation!
admin.save!
