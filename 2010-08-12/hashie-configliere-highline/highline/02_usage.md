!SLIDE code transition=fade

# Highline

<p style="font-size: 25px; margin-bottom:30px;">ERb output (folosind 'HighLine's ANSI colors')</p>

    @@@ruby
    say("This should be 
      <%= color('red', :red) %>!")
      
    say("This should be 
      <%= color('white on black', :white, :on_black) %>!")
      
    say("This should be 
      <%= color('bold', BOLD) %>!")
      
    say("This should be 
      <%= color('underlined', UNDERLINE) %>!")

!SLIDE code transition=fade

# Highline

    @@@ruby
    ask("Company?  ") { |q| q.default = "none" }
    
    ask("Age?  ", Integer) { |q| q.in = 0..105 }
    
    ask("Name?  ") { |q| q.validate = /\A\w+, ?\w+\Z/ }
    
    agree("Cool?")

!SLIDE code transition=fade

# Highline

    @@@ruby
    choose do |menu|
      menu.prompt = "Please choose:"

      menu.choice :ruby do 
        say("Good choice!")
      end
      
      menu.choices(:python, :perl) do
        say("Not from around here, are you?")
      end
    end
