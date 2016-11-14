class User
  def initialize(name, money = 0)
    @name = name
    @money = money
    @memory = {}
  end

  def give_money(amount)
    if amount < 1 || amount > @money
      puts("I can't, I don't have enough money (#{@money}$)")
      return false
    end
    puts("#{@name} give #{amount}$")
    @money -= amount
    return true
  end

  def receive_money(amount)
    if amount >= 0
      @money += amount
      puts("#{@name} receive #{amount}$")
    end
  end

  def get_name
    return @name
  end

  def add_to_memory(key, value)
    @memory[:key] = value
  end

  def get_from_memory(key)
    return @memory[:key]
  end

end

class Bank


  def initialize()
    @accounts = {}
    @account_index = 0
  end

  def import_user_accounts_data(user_accounts_data)
    user_accounts_data.each do |account|
      create_account(account[:name], account[:balance])
    end
  end

  def create_account(name, balance)
    puts("Account created with id : #{@account_index} and name : #{name} with balance : #{balance}")
    @accounts[@account_index] = Account.new(name, balance)
    @account_index+=1
  end

  def open_account (user, balance=0)
    puts("#{user.get_name} Open an account")
    balance += 100
    user.add_to_memory("accountID", @account_index)
    create_account(user.get_name, balance)
  end

  def display_account_balance(user)
    id = user.get_from_memory("accountID")
    acc = @accounts[id]
    puts("Account #{id} Owner #{user.get_name} Balance #{acc.get_balance}")
  end

  def withdraw_money(user, amount)
    id = user.get_from_memory("accountID")
    acc = @accounts[id]
    if acc.get_money(amount)
      user.receive_money(amount)
      puts("#{user.get_name} withdraw #{amount} from the bank")
    end
  end

  def fill_my_account(user, amount)
    id = user.get_from_memory("accountID")
    acc = @accounts[id]
    if user.give_money(amount)
      acc.fill_account(amount)
      puts("#{user.get_name} fill his account with #{amount}")
    end
  end

  def display_stats
    average = 0
    median = 0
    creditors = 0
    debitors = 0
    dump_array = []
    @accounts.each do |key, account|
      bal = account.get_balance
      if bal >=0
        creditors+=1
      end
      if bal < 0
        debitors +=1
      end
      average += bal
      dump_array.push(bal)
    end
    sorted = dump_array.sort
    len = sorted.length
    median = (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    average /= @accounts.size
    puts("=============  Bank stats  =============")
    puts("Creditors : #{creditors}")
    puts("Debitors : #{debitors}")
    puts("Median : #{median}")
    puts("Average : #{average}")

  end

end

class Account

  def initialize(name, balance)
    @id = name
    @balance = balance
    file = File.new("#{@id}.account", "w")
    file.close
  end

  def get_money(amount)
    if verify_account_balance(amount)
      puts("Account debited with #{amount}$")
      @balance -= amount
      write_in_log_file("DEL #{amount}")
      true
    end
    write_in_log_file("DEL #{amount} FAILED")
    false
  end

  def fill_account(amount)
    if amount >= 0
      puts("account credited with #{amount}$")
      @balance += amount
      write_in_log_file("ADD #{amount}")
    end
  end

  def verify_account_balance(amount_wanted)
    if amount_wanted >= 0 && amount_wanted > @balance
      return false
    end
    return true
  end

  def get_balance
    write_in_log_file("SHO #{@balance}")
    return @balance
  end

  def get_id
    return @id
  end

  private
  def write_in_log_file(str)
    file = File.open("#{@id}.account", "a")
    file.puts(str + " #{Time.now.inspect}")
    file.close
  end

end



#MAIN

donald = User.new('Donald', 10)
picsou = User.new('Picsou', 1000000000000000)
accounts = [{name: 'Riri', balance: 200}, {name: 'Fifi', balance: -300}, {name: 'Loulou', balance: 1000}]

bank = Bank.new

bank.open_account(donald)
bank.display_account_balance(donald)

bank.fill_my_account(donald, 10)
bank.display_account_balance(donald)

bank.withdraw_money(donald, 100)
bank.display_account_balance(donald)

bank.withdraw_money(donald,4000)
bank.display_account_balance(donald)

bank.open_account(picsou, 1)
bank.display_account_balance(picsou)

bank.withdraw_money(picsou, 101)
bank.display_account_balance(picsou)

bank.import_user_accounts_data(accounts)

bank.display_stats