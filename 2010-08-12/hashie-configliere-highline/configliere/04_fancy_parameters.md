!SLIDE code transition=fade

# Configliere
## Fancy Parameters
    
    @@@ruby
    Settings.use :define
    Settings.define :eta, 
      :type => DateTime, 
      :description => 'Estimated Arrival time'
    
    Settings.define :password,
      :required => true,
      :encrypted => true
    