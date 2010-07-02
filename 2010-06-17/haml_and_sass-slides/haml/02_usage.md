!SLIDE code transition=fade
<p style="font-size: 25px;">Tag-urile HTML incep cu "%"</p>

    %one
      %two
        %three HAML ruleaza!

<p style="font-size: 25px;">Tag-urile HTML nu trebuie inchise</p>

<hr />

    @@@html
    <one>
      <two>
        <three>HAML ruleaza!</three>
      </two>
    </one>


!SLIDE small transition=fade

<p style="font-size: 25px; margin-bottom:10px;">se folosesc hashes pentru atribute</p>
    
    @@@html
    %h1{ :id => "titlu", :class => "mare" } HAML ruleaza!
    <h1 id="titlu" class="mare">HAML ruleaza!</h1>
<hr />

<p style="font-size: 25px; margin-bottom:10px;">"#" specifica id-ul</p>

    @@@html
    %h1#titlu{ :class => "mare" } HAML ruleaza!
    <h1 id="titlu" class="mare">HAML ruleaza!</h1>
<hr />

    
<p style="font-size: 25px; margin-bottom:10px;">"." specifica clasa</p>
    @@@html
    %h1#titlu.mare HAML ruleaza!
    <h1 id="titlu" class="mare">HAML ruleaza!</h1>


!SLIDE transition=fade

<p style="font-size: 25px; margin-bottom:10px;">"=" specifica o expresie Ruby</p>
    %li= friend.name
<hr />

<p style="font-size: 25px; margin-bottom:10px;">"-" specifica cod Ruby care nu printeaza</p>
    - @friends.each do |friend|
<hr />

    @@@html
    %ul#friends
      - @friends.each do |friend|
        %li=friend.name
    
    <ul id="friends">
      <li>Stan</li>
      <li>Eric</li>
      <li>Kyle</li>
      <li>Kenny</li>
    </ul>
