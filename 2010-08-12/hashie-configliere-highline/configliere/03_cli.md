!SLIDE code transition=fade

# Configliere
## Command Line Parameters
    
    @@@ruby
    Settings.use :commandline
    Settings.resolve!
    
    ruby time_machine --eta=2010-08-12
    
    Settings[:eta]    # => '2010-08-12'
  