!SLIDE bullets transition=fade

#SASS

* genereaza CSS
* nested selectors
* variabile
* mixins


!SLIDE transition=fade

## Nested selectors

    ul#nav
      height: 23px
      li
        float: left
        a 
          font-weight: bold

<hr />
    @@@css
    ul#nav {
      height: 23px; }
      ul#nav li {
        float: left; }
        ul#nav li a {
          font-weight: bold; }

!SLIDE transition=fade

## Variabile

    !article_font_color = #333
    .article p
      color= !article_font_color
    .widget .article-snippet
      color= !article_font_color
    
<hr />
    @@@css
    .article p {
      color: #333;}
    .widget .article-snippet {
      color: #333;}

!SLIDE transition=fade

## Mixins
    =grey-box
      border: 1px solid #D3CBC6
      padding: 10px

    #box
      +grey-box
<hr />
    @@@css
    #box {
      border: 1px solid #D3CBC6;
      padding: 10px;
    }
    
!SLIDE transition=fade

## Mixins
    =grey-box(!padding)
      border: 1px solid #D3CBC6
      padding= !padding

    #box
      +grey-box(10px)
    
<hr />
    @@@css
    #box {
      border: 1px solid #D3CBC6;
      padding: 10px;
    }