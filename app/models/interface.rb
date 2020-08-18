class Interface
    attr_reader :prompt
    attr_accessor :user, :restaurants, :orders, :dishes 

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome 
        OrderHere.go
        
        puts "Luk I am your father".colorize(:red)
    end 

    def choose_login_or_signup
        prompt.select("Are you logging in or registering") do |menu|
            menu.choice "Logging in", ->{user_logging_in}
            menu.choice "Signing up", ->{user_signing_up}
        end 
    end 

    def user_logging_in
        user_logged = User.register()
        until user_logged 
            user_logged = User.register()
        end 
        self.user = user_logged
        self.main_menu
    end 

    def main_menu
        user.reload
        system "clear"
        puts "Welcome to the dark side #{self.user.name}"
        prompt.select("What else can we do") do |menu|
            menu.choice "Some choice", -> {puts "Comming soon"}
            menu.choice "Some other choice", -> {puts "Comming soon"}
        end 
    end 


  

end 
