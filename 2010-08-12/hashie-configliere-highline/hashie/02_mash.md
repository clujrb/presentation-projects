!SLIDE bullets transition=fade

# Hashie::Mash

* 'basically a Mash is a Hash'
* foloseste 'Ruby’s method punctuation idioms'
* usor de folosit pentru a imbraca hash-uri parsate din JSON sau XML

!SLIDE code transition=fade

# Hashie::Mash

<p style="font-size: 25px; margin-bottom:30px;">la baza, poate fi folosit doar pentru a scrie si citi atribute</p>

    @@@ruby
    mash = Hashie::Mash.new
    mash.name? # => false
    mash.name # => nil
    mash.name = "My Mash"
    mash.name # => "My Mash"
    mash.name? # => true
    mash.inspect # => <Hashie::Mash name="My Mash">

!SLIDE code transition=fade

# Hashie::Mash

<p style="font-size: 25px; margin-bottom:30px;">putem defini valori pe  mai multe nivele dintr-un singur hash sursa</p>
  
    @@@ruby
    hash = { :author => 
      {:name => "Stan Marsh", :email => "stan@example.com"},
       :activites => 
        [
          {:name => "school", :id => 1}, 
          {:name => "internet", :id => 2}
        ]
      }

    mash = Mash.new(hash)
    mash.author.name            # => "Stan Marsh"
    mash.activites.first.name   # => "school"

!SLIDE code transition=fade

# Hashie::Mash

<p style="font-size: 25px; margin-bottom:30px;">simple record-like objects</p>

    @@@ruby
    class Person < Mash
      def full_name
        "#{first_name} #{last_name}"
      end
    end

    person = Person.new(
        :first_name => "Stan",
        :last_name => "Marsh")
        
    bob.full_name # => "Stan Marsh"
