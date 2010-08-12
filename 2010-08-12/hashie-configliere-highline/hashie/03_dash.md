!SLIDE bullets transition=fade

# Hashie::Dash

* set de proprietati predefinite
* doar aceste proprietati pot fi definite pe hash
* se pot seta valori default pentru fiecare proprietate

!SLIDE code transition=fade

# Hashie::Dash

    @@@ruby
    class Person < Hashie::Dash
      property :name
      property :email
      property :occupation, :default => 'kid'
    end

    person = Person.new
    person.name             # => nil
    person.email = 'stan@example.com'
    person.email            # => 'stan@example.com'
    person.occupation       # => 'kid'
    p[:some_other_property] # => NoMethodError

    person = Person.new(:name => "Eric")
    person.name             # => 'Eric'
    person.occupation       # => 'kid'

!SLIDE code transition=fade

# Hashie::Trash

<p style="font-size: 25px; margin-bottom:30px;">un Dash, care ne permite sa 'traducem' cheile la initializare</p>

    @@@ruby
    class Person < Hashie::Trash
      property :first_name, :from => :firstName
    end
    
    person = Person.new(:firstName => 'Eric')
    person.first_name           # => 'Eric
    
    