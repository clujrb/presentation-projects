!SLIDE transition=fade
    
    @@@css
    #box {
      border: 1px solid #666;
      color: #CCC;
    }
<hr />
    #box
      border: 1px solid #666
      color: #CCC
      
    #box
      :border 1px solid #666
      :color #CCC
      
!SLIDE transition=fade

    ul#nav
      :height 23px
      li
        :float left
        a 
          :font-weight bold

<hr />
    @@@css
    ul#nav {
      height: 23px; }
      ul#nav li {
        float: left; }
        ul#nav li a {
          font-weight: bold; }

!SLIDE transition=fade

    .fakeshadow
      :border
        :style solid
        :left
          :width 4px
          :color #888
        right
          :width 2px
          :color #ccc

<hr />

    @@@css
    .fakeshadow {
      border-style: solid;
      border-left-width: 4px;
      border-left-color: #888;
      border-right-width: 2px;
      border-right-color: #ccc; }
    
!SLIDE transition=fade
<p style="font-size: 25px; margin-bottom:10px;">"&amp;" face trimitere la selectorii parinti</p>
    #box
      :border 1px solid #666
      :color #CCC
      &.black
        :border 1px solid #000
<hr />
    @@@css
    #box {
      border: 1px solid #666;
      color: #CCC;
    }

    #box.black {
      :border 1px solid #000
    }

!SLIDE transition=fade
<p style="font-size: 25px; margin-bottom:10px;">"&amp;" face trimitere la selectorii parinti</p>
    #box
      :border 1px solid #666
      :color #CCC
      .black &
        :border 1px solid #000
<hr />
    @@@css
    #box {
      border: 1px solid #666;
      color: #CCC;
    }

    .black #box {
      :border 1px solid #000
    }

!SLIDE small transition=fade

## Variabile

    !default_font_size = 13px
    
    a
      :font-size= !default_font_size
<hr />
    @@@css
    a {
      font-size: 13px;
    }

## Operatii

    a
      :font-size= !default_font_size + 1px
<hr />
    @@@css
    a {
      font-size: 14px;
    }
    
!SLIDE small transition=fade

## Mixins
    =grey-box
      :border 1px solid #D3CBC6
      :padding 10px

    #box
      +grey-box
<hr />
    @@@css
    #box {
      border: 1px solid #D3CBC6;
      padding: 10px;
    }


!SLIDE small transition=fade
## Variabile si Mixins
    =grey-box(!padding=10px)
      :border 1px solid #D3CBC6
      :padding= !padding
    #box
      +grey-box(5px)
<hr />
    @@@css
    #box {
      border: 1px solid #D3CBC6;
      padding: 5px;
    }

!SLIDE bullets transition=fade

### Control directives

* @if
* @for
* @while