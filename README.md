# eBookReader for Symbian^3 zh-CN
English [简体中文](./README_zh-CN.md)   
![image](./Screenshots/Entry01.png)   
eBookReader's Simplified Chinese version   
Official Site: https://ebookreader.abcreiseonline.de/?q=reader   
Publish: [ArtSoftic](https://ebookreader.abcreiseonline.de)   
Ovi Store/Nokia Store: http://store.ovi.com/content/264420   
Opera Mobile Store: http://symbian.apps.opera.com/ebookreader.html   
Bemobi Mobile Store: http://symbian.oms.apps.bemobi.com/en_us/ebookreader.html   
[![Ovi Store](./Screenshots/Nokia%20N8-00_024.jpg)](http://symbian.oms.apps.bemobi.com/en_us/ebookreader.html)
[![AppList](https://applist.schumi1331.de/images/badge.png)](https://applist.schumi1331.de/content/82)
## Introduction from the official
### Description
eBookReader is a powerful and flexible application developed by ArtSoftic for reading eBooks on Symbian^3 devices, in formats EPUB (non DRM), FB2 (.ZIP). The natural look &amp; feel and the intuitive user interface will engage you in an exceptional experience. In addition, the application is packed with follow the features you may need ( epub and fb2 import, bookmarks, library, hyperlinks, image viewer, etc.). Automatic encoding detection, table contents is supported too.
### FAQ
1. What ebook formats supported?   
The eBookReader is only designed for FB2 and ePub formats (ePub Version 2), without any support Adobe DRM (Adobe ePub with DRM) or Adobe PDF, etc.

2. Where to download books?   
Some ebooks stores find you in section "eBooks Websites".
More ebooks find you on the Web, search in Google for "fb2 for free" or "epub for free".

3. How to load the ebook in eBookReader?   
For example, if you download a file (epub or fb2) from m.gutenberg.org into the directory `"e:\download"`, in the function "+" (menu->import->import from file) you must select to first `"e:\"`, then `"download"`. You can also download books from your PC into any directory on your mobile phone. Then you'll have to go into this directory, in the "+" (menu->import->import from file) function.    
You can also use the express - import function (menu->import->express import->improt from phone or import from folder).

4. How to quickly remove a readed book from library?   
A long press on the ebook record in the library, then "Delete".   
If you want to immediately delete all readed books from the library, go to the edit mode. Then in menu choose "Select all finished books" , after this "Delete selected books".
### Screenshots
![image](./Screenshots/Nokia%20N8-00_027.png)
![image](./Screenshots/Nokia%20N8-00_018.png)
![image](./Screenshots/Nokia%20N8-00_012.png)
![image](./Screenshots/Nokia%20N8-00_028.png)
![image](./Screenshots/Nokia%20N8-00_010.png)
![image](./Screenshots/Nokia%20N8-00_001.png)
![image](./Screenshots/Nokia%20N8-00_007.png)
![image](./Screenshots/Nokia%20N8-00_023.png)
![image](./Screenshots/Nokia%20N8-00_006.png)
![image](./Screenshots/Nokia%20N8-00_030.png)
![image](./Screenshots/Nokia%20N8-00_013.png)
![image](./Screenshots/Nokia%20N8-00_017.png)   
## About this repository
### 1.07(1)
#### 2016/07/04
Fixed a minor error in AboutColumn.qml
#### 2016/07/01
Release the Simplified Chinese version 1.07(1).   

The version provided was modified by Dealtz.   

-Only modified `.qml` files because this single language version didn't content outside `.qm` language package. So book status, color selection component and Pop-up boxes for selecting alignment are not translated;   
-Changing the translation method to fix the problem of showing garbled Chinese text on low version Qt platform or other case;   
-ToolButton's `flat` attribute removed;   
-Add save settings toolbutton in "More options";    
-Add some extensive explanatory text while respecting the original.   

*Qt platform required   
*Unsigned because of modification   
*Original version 1.07(1) signed until 2016/05/16
#### 2013/12/23
The official release 1.07(1) available on Nokia Store.   
*This version is a single language version in English.   

Changelog v1.07(1)   
-Experimental support for epub(version3)
### 1.07(0)
#### 2016/07/01
Some modifications based on the @Kaiyangx Chinese text to @Kaiyangx's modified version and recover some English that should not be translated.   
UI fixes (removing button flat borders) and adding explanatory text.   
Changing the translation method to remove garbled Chinese text on low version Qt platform or other case.   
By Dealtz
#### 2013/??/??
@Kaiyangx release his Chinese version.
#### 2013/06/03
The official release 1.07(0) available on Nokia Store.   
*This version is a dual language version in both Russian and English.   

Changelog v1.07(0)   
-Background color setup in the image viewer   
-Integration with eBookReader webpage
### 1.06(0)
#### 2013/??/??
@Fanxi release his Chinese version.
#### 2013/01/19
The official release 1.06(0) available on Nokia Store.   
*This version is a dual language version in both Russian and English.   

Changelog v1.06(0)   
-Copying text to the clipboard   
-Express import of books   
-Bug fixes
## What's more
This repository only provides the unofficial Chinese version of 1.06(0), 1.07(0) and 1.07(1).   
The application was updated in 1.07(2) to include the official German `.qm` language pack, which finally officially supports English Russian and German.   
I forgot to collect the official version 1.07(2) and the unofficial Chinese version of 1.07(2) translated by @kaiyangx in 2014. So I can’t provide the Chinese version of 1.07(2). If you have the `.sis` Symbian installation package of this version, please create an issue and submit the `.sis` file to me. Thank you!