!SLIDE bullets transition=fade

# Hashie::Clash

* Chainable Lazy Hash
* se pot construi usor hash-uri complexe folosind 'the method notation chaining'
* o metoda generalizata care ofera aceeasi 'chainability' ca si named_scopes

!SLIDE code transition=fade

# Hashie::Clash

    @@@ruby
    clash = Hashie::Clash.new
    clash.where(:abc => 'def').order(:created_at)
    clash   # => { :where => 
            # =>  { :abc => 'def' },
            # =>  :order => :created_at
            # => }
