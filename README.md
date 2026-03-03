# READ ME - Disa-Johansson-portfolio

**Course:** BE26 | HTML & CSS
**Assigment:** Slutuppgift HTML / CSS


### Link to Netlify:
https://disajohanssongrit.netlify.app/


### README on Github
https://github.com/Shyz99/SchoolDisaGrit


------------------------------------------------------
## Description and target group

The target audience for this assigment and webbsite is for companies withing the Game and tech industry to see my work and expertices.
This is mainly to use as a portfolio for freelancing and have it linked on my social medias so the target group can contact me or I can share my portfolios with companies I want to work with.

Thats why the webbsite is focus on what escperices that is conected to what project and show more quality then quantity.
An emplopyer or talent-scout spends very little time rewiving portfolios so its important to be straught forward and have the projects easy acceseble.






------------------------------------------------------
## Checklist

### 1. Struktur & semantik
### 2. Layout 

-- **DONE** --
I have created 3 html pages and linked to everyone of them - index/html, artgallery.html & aboutme.html
And used correct sematic with always having a header, nev, main and footer in all the pages.
Then used Article for sections that are a part of a bigger group but can also be stand alone content if they were to be sepreated.

I have more than one part built with Display: Flex;
One example is the images in artgallery.html , they use for example:
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
And I adjust the sizes of the images depending on the screen width. Then the wrap setting in flex to get them to change positions based on their scale and screen width.

Display grid is mainly used on the <Form> section in aboutme.html.
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-template-rows: 1fr 0.4fr 0.4fr 1fr 0.1fr;

It is used here to have a grid to display always the content as intened, and the witdh of the content and colum size is dynamic to the screen witdh.




### 3. Responsivitet 

-- **DONE** --
The three break points I have used for the webbsite is: 1024px, 720px & 415px.
I have based this on the different Iphone and ipad sizes that can be used in the browser webbtool.
For example Iphon 14 Pro Max lookes good with the 720px settings, but if I tried the Iphon SE it was not fitting. So the 415px settings is mainly regarding for very samll screens, for example older Iphones.
This will also make the webbsite more accesible for people with older hardware, like phones and PC-displays.


All pictures are responsive to the witdh in pixeles on all screens. The move and adjust size deppending on what breakpoint it is on.
Also note that all images in /images have been optimized regarding size in mb/kb to be in a good size for the page loadings.



### 4. Typografi & färg 

-- **DONE** --
All pages and sections have the right order and importances on the headings. For example in the Header H1 is used for the most inportant titel and H2 for the second after.
Then in a new secction under the header section H1 is used for the page titel and then the H2 for the sections under titles.

All colors are checked with WAVE and similar tools to score the contrast. All contrast passes the score.
For example have I implemented a dark gradient over the cards so the light text have good contrast and can be easily read.




### 5. Tillgänglighet 

-- **DONE** --
All picture that has a value for the content and are not just "Decoration" has an alt-text to describe them.
Same with links, if the link is very descriptive no arial label is used. But if the link dose nopt directly describes what it dose I have been using arial label.



### 6. Formulär 

-- **DONE** -- 
In the aboutme.html a simpel fourm is created to be abel to contact me conected to my expertices.
It consists of both mandatory and non-mandatory questions.



### 7. Publicering / körning 

-- **DONE** -- 
I have published the webbsite to Netlify, so no instructions for how to start it localy is needed.



### 8. Kvalitet 
-- **DONE** -- 
All code has been clenad up so everything has a purpose.
Same with links, all links work, both to the different html pages and external webbsites (date for last tested external webbsites by me: 03-03-2026)

Same with folder, files and images soting in the project, they have been named and sorted accoringly to a readble structure.


### 9. Kodvalidering 

-- **DONE** -- 
Other than the webbsite been controled with the lence of WAVE, it has also been put in a HTML and CSS validators.
No errors have been found in the files.





------------------------------------------------------
## Knowned issues & Comments about my choices

### Wave Warnings - "An embedded or linked YouTube video is present"
Wave will display a warning in index.html on row: 217, regarding the *Youtube link*.
The warning is refered to the video not being abel to display on the webbsite.

This is a choice by me to not have it displayed on my webbsite. I do not want an external video to be displayed on the webbsite.
I have built the webbsite from a perspektive with having the cards all the same style for better readablility.


### Wave Warnings - "An image has very long alternative text."

I know that the images in artgallery.html have very long descriptions and that WAVE gives warning about them. But I took the choise to keep them in, like other official webbsites have.
In my case is it mainly that the images in this section is not decorations, they are a part of the portfolio and its important that they are describe as such.
This was hard to do in short terms so I choose to keep them in as mention.


### artgallery.html - Display of images
If you start the project localy with live server the flex display for all **img** will look different compared to how it looks published on Netlify.
How it looks on Netlify is the intened look and behaviour of how I want the Display: Flex, should be displayed.
I do not know how to solve this issue and I assume it has something to do with lvie servers previwe.


### Pictures loading in for background-img
As mention before, allt images are scaled downed and optimized in storage size, but somethimes the hover effect on the cards in indes.html loadsin slower than the non-hover card backgrounds.
Just hover over them one time and the next time it should work as intened.


### index.html 
When uploading and publish on Netlify, if the index.html was not in the root, it could not be run.
I have tried to change Netlify location for the index.html but I did not find it. So compared to all the other HTML files thata are in the html-folder.
The index.html is in the root with the README.txt


### CSS validators
On all CSS files ( Exept for globa.css ), the Validator will give the following warning:
"CSS variable "--sweetpinkdarkest" is used but not declared in this file - it may be defined elsewhere" 
This is okay I assume, due to me having all the varibles for the colors in global.css, and it would not be DRY if I add all colors variables to all css files.
