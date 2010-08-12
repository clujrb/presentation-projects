!SLIDE bullets small transition=fade

# Configliere

* discreet configuration for ruby scripts.
* mai multe surse: static constants, simple config files, environment variables, commandline options, straight ruby
* nu trebuie sa predefinim nimic
* type-convert, require, document or password-obscure
* Configliere settings sunt de fapt un simplu hash.

!SLIDE code transition=fade

# Configliere
    
    @@@ruby
    Settings.use :config_file, :commandline, :define

    Settings({
      :eta => '2010-08-12',
      :fluxcapacitor => {
        :speed => 88
        }
    })
    Settings.read('/etc/time_machine.yaml')
    
    Settings.resolve!
    
    Settings['eta'] # => '2010-08-12