---
header:
  - type: text2
    height: 150
    paddingX: 50
    paddingY: 0
    align: center
    title:
      - Welcome To my Notes
    subtitle:
      - A Journal Where I keep all My Tech notes in One Place.
      - Linux , Docker , .Netcore , Javascript n (Frameworks) , C# , Bash cli

    titleColor: '#EA6B66'
    titleShadow: false
    titleFontSize: 35
    subtitleColor:
    subtitleCursive: true
    subtitleFontSize: 23
    height: 200
    spaceBetweenTitleSubtitle: 16

  - type: img
    imageSrc: images/header/background.jpg
    imageSize: cover
    imageRepeat: no-repeat
    imagePosition: center
    height: 235
    paddingX: 50
    paddingY: 0
    align: center
    title:
      -
    subtitle:
      -
    titleColor:
    titleShadow: false
    titleFontSize: 44
    subtitleColor:
    subtitleCursive: false
    subtitleFontSize: 16
    spaceBetweenTitleSubtitle: 20

  - type: slide
    height: 235
    options:
      startSlide: 0
      auto: 10000
      draggable: true
      autoRestart: true
      continuous: true
      disableScroll: true
      stopPropagation: true
    slide:
      - paddingX: 50
        paddingY: 0
        align: left
        imageSrc: images/ideatechblog.png
        imageSize: cover
        imageRepeat: no-repeat
        imagePosition: center
        title:
          -
        subtitle:
          -
        titleFontSize: 44
        subtitleFontSize: 16
        spaceBetweenTitleSubtitle: 20

  - type: typewriter
    methods:
      - typeString: Hello world!
      - pauseFor: 2500
      - deleteAll: true
      - typeString: Strings can be removed
      - pauseFor: 2500
      - deleteChars: 7
      - typeString: <strong>altered!</strong>
      - pauseFor: 2500
    options:
      loop: true
      autoStart: false
    height: 190
    paddingX: 50
    align: center
    fontSize: 44
    fontColor: yellow

  - type: text
    height: 50
    paddingX: 50
    paddingY: 0
    align: center
---