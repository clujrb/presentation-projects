!SLIDE code transition=fade

# Configliere
## Command Line Parameters
    
    @@@ruby
    Settings.use :commandline
    Settings.resolve!
    
    ruby time_machine --eta=1985-11-05
    
    Settings[:eta]    # => '2010-08-12'
  