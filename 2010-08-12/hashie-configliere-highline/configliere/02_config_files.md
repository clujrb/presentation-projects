!SLIDE code transition=fade

# Configliere
## Config Files
    
    @@@ruby
    Settings.use :config_file
    Settings.read('/etc/time_machine.yaml')
    Settings.resolve!
    
    Settings[:eta]    # => '2010-08-12'
