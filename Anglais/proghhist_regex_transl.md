# Programming Historian
## Understanding Regular Expressions
https://programminghistorian.org/lessons/understanding-regular-expressions#finding-structure-for-rows

---


## Finding structure for rows
We are just getting started, but to estimate how far we have to go, select the full text from LibreOffice Writer (`Ctrl-A`) and paste it into LibreOffice Calc (`File->New->Spreadsheet`). Each line of text becomes a single-celled row of the spreadsheet. What we would like is for each row of the spreadsheet to represent one kind of record in a consistent form. It would take a lot of tedious work to tabulate this by hand with this as our starting point. In what follows we will be doing all our work with regular expressions in Writer, but keep Calc open in the background. We can return to it to paste future iterations and gauge our progress.  
Returning to Writer, we will want to get rid of the line breaks that we don’t need — but there are some end-of-line hyphenations we should clean up first. This time we will start using regular expressions, but with a disclaimer that regular expression implementations differ in their handling of line breaks more than in their features for matching patterns within lines.  
Regular expressions in LibreOffice do not readily match patterns of text that extend across line breaks, so we will adopt an indirect strategy . We will first replace line breaks with a placeholder character — let’s use `#` — that does not otherwise appear in our text.  
In the Find & Replace box show `More Options` (Other Options on Mac) and make sure the `Regular expressions` checkbox is selected. This will enable us to use special symbols to define general patterns to match.  
Using find-and-replace,  
replace `$` with `#`.

![regex_2](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "regex_2")  
*Figure 3: The ‘More Options’ tab in Open Office Find & Replace*  

The dollar sign symbol is a special symbol that traditionally matches the end of each line in order to anchor a larger pattern. However, while it can have this function in LibreOffice in larger patterns, LibreOffice will not let us let us match text across line breaks. But LibreOffice will let us use the `$` character on its own, without other patterns, to match and replace line breaks independent of other characters.  
To carry out a search and replace operation, you might start by clicking `Find` and then `Replace` when you see that the highlighted selection matches your expectations. After repeating this a few times you can click `Replace All` to replace all the rest at once. If you make a mistake or are uncertain, you can undo recent steps with `Edit → Undo` from the menu bar, or keyboard shortcut `Ctrl+Z` (Cmd+Z on Mac).  
In this document replacing line ends results in 291 replacements. (Your number may differ slightly depending on the number of lines you copied.) This sequence of replacements will make the text less readable, temporarily, but it’s necessary because we cannot match patterns across line breaks, but we can match across a `#` character.  
Next let’s close up our hyphenated words. This in fact can now be accomplished by literal replacement without relying on generalized pattern matching.  
Again using find-and-replace,  
replace all - `#` (hyphen-space-hash) with nothing.  
This will close up patterns like “tuber- #culosis” to “tuberculosis” on one line, and will make a total of 27 replacements in this case.  
Next:  
replace all `##` with `\n`.  
This results in 71 replacements. In this step we take what were originally paragraph breaks, which appeared as double line breaks, and then were represented as doubled `#` characters, and we turn them back again into actual single line breaks. These will function in a spreadsheet context to mark new rows.  
To conclude our line break work:  
replace all `#` with \` \` \*(a single space). This will get rid of 122 line breaks that were not paragraph breaks in the original text.  
At first it may not be clear what happened here, but this has in fact made each paragraph a single paragraph or logical line. In LibreOffice (and similar word processing programs) you can turn on nonprinting characters (View→Nonprinting Characters with shortcut `Ctrl-F10 on Windows or Linux`) to see line and paragraph breaks.  

![regex_3](https://programminghistorian.org/images/understanding-regular-expressions/regex_03_lines.png "regex_3")  
*Figure 4: Non-Printing Characters in LibreOffice*  

As a last way of confirming that we are starting to get a more useful structure from this, let’s copy the full text from Writer again and paste it into a blank spreadsheet. This should confirm that each health record is now a separate row in the spreadsheet (although we also have page headings and footnotes mixed in — we will clean those up shortly).  

![regex_4](https://programminghistorian.org/images/understanding-regular-expressions/regex_04_calclines.png "regex_4")  
*Figure 5: The improved structure, shown in LibreOffice Calc*  

## Finding structure for columns
Spreadsheets organize information in two dimensions, rows and columns. We have seen that lines in Writer correspond to rows in Calc. How do we make columns?  
Spreadsheet software can read and write plain-text files using any of several conventions for representing breaks between columns. One common format uses commas to separate columns, and such files are often stored with the extension “.csv” for “comma-separated values.” Another common variant is to use a tab character, a special kind of space, to separate columns. Because our text contains commas, to avoid confusion we will use a tab character to separate columns. Though one could save a intermediate plain-text file, in this exercise we will assume we are copying and pasting directly from Writer to Calc.  
Back in Writer, let’s start making columns by splitting the place-and-time information from the reported numbers. Almost all reports include the words  
`Total number of deaths`  
Search for this and replace it with exactly the same phrase, but with “\\t” at the front of the string representing a tab character:  
`\tTotal number of deaths`  
After making this replacement (which makes 53 changes), select all the text and copy and paste it into an empty spreadsheet again.  
Does it look like nothing changed? LibreOffice Calc is putting the full text of each paragraph in a single cell, tabs and all. We need to insist on a plain-text interpretation to get Calc to ask us what to do with tabs. Let’s try again. You can empty the spreadsheet conveniently by selecting all (`Ctrl-A`) and deleting the selection.  
In an empty spreadsheet, select `Edit → Paste Special`, (or right-click to reach the same) and then select “unformatted text” from the options in the window appears. That should result in a popup “Text Import” window. Make sure the Tab checkbox is selected under Separator options and then click “OK”. (Before clicking OK you may want to try checking and unchecking Comma and Space as separators to preview what they would do here, but we do not want to treat them as separators in this context.)  
Now we see the promising start of a table structure, with geography and time span still in column A, but with “Total number of deaths” and subsequent text clearly aligned in a separate column.

![regex_5](https://programminghistorian.org/images/understanding-regular-expressions/regex_05_2col.png "regex_5")  
*Figure 6: The newly tab-delimited version of the data shown in LibreOffice Calc*

Do you have any instances that moved over into a third column or beyond? In that case you may inadvertently have put in too many tabs. In the structure we have right now we don’t expect to ever see two tab characters in a row. Back in LibreOffice Writer we can check for this and fix the problem by searching for
`\t\t` and replacing with `\t`  
**repeating as needed** until no more double-tabs are found.  
Sometimes multiple applications of a replacement pattern introduce additional changes after the first, which may or may not be what we intend, and sometimes multiple applications will have no effect beyond the first application. It is worth keeping this distinction in mind while working with regular expressions.  

---

Traduction en Français :  

## Trouver la structure pour les lignes
Nous commençons à peine, mais pour évaluer jusqu'où il nous faut aller, sélectionnez tout le texte dans LibreOffice Writer (`Ctrl-A`) et copiez-le dans LibreOffice Calc (`File->New->Spreadsheet`). Chaque ligne de texte devient une ligne de cellules uniques dans le tableur.

---

 Each line of text becomes a single-celled row of the spreadsheet. What we would like is for each row of the spreadsheet to represent one kind of record in a consistent form. It would take a lot of tedious work to tabulate this by hand with this as our starting point. In what follows we will be doing all our work with regular expressions in Writer, but keep Calc open in the background. We can return to it to paste future iterations and gauge our progress.  
Returning to Writer, we will want to get rid of the line breaks that we don’t need — but there are some end-of-line hyphenations we should clean up first. This time we will start using regular expressions, but with a disclaimer that regular expression implementations differ in their handling of line breaks more than in their features for matching patterns within lines.  
Regular expressions in LibreOffice do not readily match patterns of text that extend across line breaks, so we will adopt an indirect strategy . We will first replace line breaks with a placeholder character — let’s use `#` — that does not otherwise appear in our text.  
In the Find & Replace box show `More Options` (Other Options on Mac) and make sure the `Regular expressions` checkbox is selected. This will enable us to use special symbols to define general patterns to match.  
Using find-and-replace,  
replace `$` with `#`.

![regex_2](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "regex_2")  
*Figure 3: The ‘More Options’ tab in Open Office Find & Replace*  

The dollar sign symbol is a special symbol that traditionally matches the end of each line in order to anchor a larger pattern. However, while it can have this function in LibreOffice in larger patterns, LibreOffice will not let us let us match text across line breaks. But LibreOffice will let us use the `$` character on its own, without other patterns, to match and replace line breaks independent of other characters.  
To carry out a search and replace operation, you might start by clicking `Find` and then `Replace` when you see that the highlighted selection matches your expectations. After repeating this a few times you can click `Replace All` to replace all the rest at once. If you make a mistake or are uncertain, you can undo recent steps with `Edit → Undo` from the menu bar, or keyboard shortcut `Ctrl+Z` (Cmd+Z on Mac).  
In this document replacing line ends results in 291 replacements. (Your number may differ slightly depending on the number of lines you copied.) This sequence of replacements will make the text less readable, temporarily, but it’s necessary because we cannot match patterns across line breaks, but we can match across a `#` character.  
Next let’s close up our hyphenated words. This in fact can now be accomplished by literal replacement without relying on generalized pattern matching.  
Again using find-and-replace,  
replace all - `#` (hyphen-space-hash) with nothing.  
This will close up patterns like “tuber- #culosis” to “tuberculosis” on one line, and will make a total of 27 replacements in this case.  
Next:  
replace all `##` with `\n`.  
This results in 71 replacements. In this step we take what were originally paragraph breaks, which appeared as double line breaks, and then were represented as doubled `#` characters, and we turn them back again into actual single line breaks. These will function in a spreadsheet context to mark new rows.  
To conclude our line break work:  
replace all `#` with \` \` \*(a single space). This will get rid of 122 line breaks that were not paragraph breaks in the original text.  
At first it may not be clear what happened here, but this has in fact made each paragraph a single paragraph or logical line. In LibreOffice (and similar word processing programs) you can turn on nonprinting characters (View→Nonprinting Characters with shortcut `Ctrl-F10 on Windows or Linux`) to see line and paragraph breaks.  

![regex_3](https://programminghistorian.org/images/understanding-regular-expressions/regex_03_lines.png "regex_3")  
*Figure 4: Non-Printing Characters in LibreOffice*  

As a last way of confirming that we are starting to get a more useful structure from this, let’s copy the full text from Writer again and paste it into a blank spreadsheet. This should confirm that each health record is now a separate row in the spreadsheet (although we also have page headings and footnotes mixed in — we will clean those up shortly).  

![regex_4](https://programminghistorian.org/images/understanding-regular-expressions/regex_04_calclines.png "regex_4")  
*Figure 5: The improved structure, shown in LibreOffice Calc*  

## Trouver la structure pour les colonnes  
Spreadsheets organize information in two dimensions, rows and columns. We have seen that lines in Writer correspond to rows in Calc. How do we make columns?  
Spreadsheet software can read and write plain-text files using any of several conventions for representing breaks between columns. One common format uses commas to separate columns, and such files are often stored with the extension “.csv” for “comma-separated values.” Another common variant is to use a tab character, a special kind of space, to separate columns. Because our text contains commas, to avoid confusion we will use a tab character to separate columns. Though one could save a intermediate plain-text file, in this exercise we will assume we are copying and pasting directly from Writer to Calc.  
Back in Writer, let’s start making columns by splitting the place-and-time information from the reported numbers. Almost all reports include the words  
`Total number of deaths`  
Search for this and replace it with exactly the same phrase, but with “\\t” at the front of the string representing a tab character:  
`\tTotal number of deaths`  
After making this replacement (which makes 53 changes), select all the text and copy and paste it into an empty spreadsheet again.  
Does it look like nothing changed? LibreOffice Calc is putting the full text of each paragraph in a single cell, tabs and all. We need to insist on a plain-text interpretation to get Calc to ask us what to do with tabs. Let’s try again. You can empty the spreadsheet conveniently by selecting all (`Ctrl-A`) and deleting the selection.  
In an empty spreadsheet, select `Edit → Paste Special`, (or right-click to reach the same) and then select “unformatted text” from the options in the window appears. That should result in a popup “Text Import” window. Make sure the Tab checkbox is selected under Separator options and then click “OK”. (Before clicking OK you may want to try checking and unchecking Comma and Space as separators to preview what they would do here, but we do not want to treat them as separators in this context.)  
Now we see the promising start of a table structure, with geography and time span still in column A, but with “Total number of deaths” and subsequent text clearly aligned in a separate column.

![regex_5](https://programminghistorian.org/images/understanding-regular-expressions/regex_05_2col.png "regex_5")  
*Figure 6: The newly tab-delimited version of the data shown in LibreOffice Calc*

Do you have any instances that moved over into a third column or beyond? In that case you may inadvertently have put in too many tabs. In the structure we have right now we don’t expect to ever see two tab characters in a row. Back in LibreOffice Writer we can check for this and fix the problem by searching for
`\t\t` and replacing with `\t`  
**repeating as needed** until no more double-tabs are found.  
Sometimes multiple applications of a replacement pattern introduce additional changes after the first, which may or may not be what we intend, and sometimes multiple applications will have no effect beyond the first application. It is worth keeping this distinction in mind while working with regular expressions.  
