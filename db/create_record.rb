def create_admin_user
	unless User.where(email: "admin@gmail.com").any?
	  ['Saving', 'Salary','Current'].each do |title|
	    AccountType.create(title: title)
	  end

	  Department.create([
	    { name: "HR" },
	    { name: "Finance" },
	    { name: "Loan" },
	    { name: "Insurance" },
	    { name: "Marketing" }
	  ])

	  admin_user = FactoryBot.create(:user, is_admin: true, username: "admin", email: "admin@gmail.com")
	  account_type = AccountType.where(title: "Current").first
	  admin_customer = FactoryBot.create(:customer, account_type: account_type, current_balance: 10000000.00)
	  admin_nominee = FactoryBot.create(:nominee, customer:admin_customer)

	  create_address(admin_customer)
	  create_address(admin_nominee)
	  create_user_information(admin_user, admin_customer, admin_customer)
	end
	create_manager #create manager
end

def create_manager
  10.times do |i|
    user = create_user
    department = Department.take
    manager = FactoryBot.create(:manager, user: user, department: department)

    create_employee_information(user, department, manager)
    p "manager created #{i}"
  end
  create_employee #create employees
end

def create_employee
  90.times do |i|
    user = create_user
    department = Department.take
    manager = Manager.take

    create_employee_information(user, department, manager)
    p "employee created #{i} Department emp count #{Department.find(department.id).employee_count}"
  end
  create_customer #create customers
end

def create_customer
  3999.times do |i|
    user = create_user
    account_type = AccountType.take
    customer = FactoryBot.create(:customer, account_type: account_type)

    nominee = FactoryBot.create(:nominee, customer:customer)
    customer_address = create_address(customer)
    nominee_address = create_address(nominee)
    create_user_information(user, customer, customer)
    puts "customer created #{i} customer card: #{customer.cards.first.status}"
  end
  customer_transactions #create customer transactions
end

def customer_transactions
  15000.times do |i|
    check_amount
    card = Card.take
    sender = card.customer.user_information
    receiver = UserInformation.take
    particular = FactoryBot.create(:particular, card: card, sender:sender, receiver:receiver)
    puts "customer particular #{i}"
  end
  employee_salary_transaction #create employee salary transactions
end

def employee_salary_transaction
  10000.times do |i|
    check_amount
    employee_user_information = Employee.take.user_information

    particular = FactoryBot.create(:particular, card: Card.first, sender: admin_user_information, receiver: employee_user_information)
    salary = FactoryBot.create(:salary, particular: particular, employee: employee_user_information.accountable)
    puts "Salary created #{i}"
  end
end

def create_user
	user = FactoryBot.build(:user)
	p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{user.errors.each {|error| p error}}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" unless user.valid?
	p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{user.errors.each {|error| p error}}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" unless user.valid?
	p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{user.errors.each {|error| p error}}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" unless user.valid?

	user.save if user.valid?
	return User.last if user.save
	create_user

	# if user.valid?
  # 	user.save
  # 	return User.last
  # else 
  # 	create_user
  # end
	# user.valid? ? user.save : create_user
end

def create_employee_information(user, department, manager)
	account_type = AccountType.where(title: "Salary").first
	customer = FactoryBot.create(:customer, account_type: account_type)
	employee = FactoryBot.create(:employee, manager: manager, department:department, customer: customer)

	create_address(employee)
	create_user_information(user, employee, customer)
end

def create_user_information(user, accountable, customer)
	FactoryBot.create(:user_information, user: user, accountable: accountable)
	FactoryBot.create(:card, customer: customer, status: 'active')
end

def create_address(addressable)
	FactoryBot.create(:address, addressable:addressable)
end

def check_amount
	admin_customer = admin_user_information.accountable
	admin_customer.udpate(current_balance: 10000000) if admin_customer.current_balance <= 100000
end

def admin_user_information
	User.find_by(email: "admin@gmail.com").user_information
end
