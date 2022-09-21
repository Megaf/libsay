## libsay commands.
Commands provided by importing libsay to your shell or project.

This is a brief overview of the commands available in the `libsay` library.

|Command              |Argument           |Description                                                       |Example                                    |
|---------------------|-------------------|------------------------------------------------------------------|-------------------------------------------|
|`say`                |"string"           |Draws lines around text and formats it. From string, pipe or var. |`say "Hi`,`echo "Hi" | say`,`say file.txt` |

### Setting Colours
|Command              |Argument           |Description                                                       |Example                                    |
|---------------------|-------------------|------------------------------------------------------------------|-------------------------------------------|
|`set_colour`         |"fg"/"bg" "colour" |Sets the foreground/background colour to the desired colour.      |`set_colour "fg" "light_blue"; echo "Hi"`  |
|`set_border_colour`  |none               |With `say`, colours the box borders from `$border_colour` var.    |`border_colour=light_cyan say "Hello!"`    |

### Manipulating Text
|Command              |Argument           |Description                                                       |Example                                    |
|---------------------|-------------------|------------------------------------------------------------------|-------------------------------------------|
|`symbol_repeat`      |"character" "count"|Repeats a character a certain amount of times.                    |`symbol_repeat "_" "4"`                    |
|`rst`                |none               |Resets terminal's text style, effects and colours to the default. |`rst`                                      |

### Text Effects
|Command              |Argument           |Description                                                       |Example                                    |
|---------------------|-------------------|------------------------------------------------------------------|-------------------------------------------|
|`underline_on`       |none               |Underlines text after the command.                                |`underline_on; echo "Hello There!"`        |
|`double_underline_on`|none               |Same as above, but with a double line instead.                    |`double_underline_on; echo "Greetings"`    |
|`overline_on`        |none               |Adds a line above the text, underline but overline.               |`overline_on; echo "I'm overlined."`       |
|`overunder_on`       |none               |Adds an underline and a overline.                                 |`overunder_on; echo "Above and below"`     |
|`bold_on`            |none               |Prints the text in bold.                                          |`bold_on; echo "hi"`/`weight=bold say "hi"`|
|`invert_on`          |none               |Makes the background color the foreground and vice versa.         |`invert_on; echo "Hello Inverted There!"`  |
|`blink_on`           |none               |Makes text blink.                                                 |`blink_on; echo "I'm a blinking text"`     |
|`italics_on`         |none               |Writes the text in Italics.                                       |`italics_on; echo "e l e g a n t  t e x t"`|
|`crossout_on`        |none               |Strikes-through text.                                             |`crossout_on; echo "A mistake perhaps."`   |
|`fade_on`            |none               |Makes the text less intense.                                      |`fade_on; echo "Not a very bright string."`|

### Default Styles
|Command              |Argument           |Description                                                       |Example                                    |
|---------------------|-------------------|------------------------------------------------------------------|-------------------------------------------|
|`c_error`            |none               |Uses colour scheme and text effect for "Error" messages.          |`c_error; echo "An Error occurted."; rst`  |
|`c_info`             |none               |Uses colour scheme and text effect for "Info" messages.           |`c_info; echo "Piece of Information"; rst` |
|`c_warning`          |none               |Uses colour scheme and text effect for "Warning" messages.        |`c_warning; echo "Warning! You Sure?"; rst`|
|`c_debug`            |none               |Uses colour scheme and text effect for "Debug" messages.          |`c_debug; echo "DEBUG: Lot's of Info"; rst`|
|`c_notice`           |none               |Uses colour scheme and text effect for "Notice" messages.         |`c_notice; echo "Notice about this."; rst` |
|`c_title`            |none               |Uses colour scheme and text effect for "Title" messages.          |`c_title; echo "This Is The Title"; rst`   |
|`c_normal`           |none               |Uses colour scheme and text effect for "Normal" messages.         |`c_normal; echo "Just a perfect day."; rst`|

### Drawing shapes
|Command              |Argument           |Description                                                       |Example                                    |
|---------------------|-------------------|------------------------------------------------------------------|-------------------------------------------|
|`draw`               |"part_name"        |draws pre defined shapes. Used internally to make the box|`draw leftside_c line line rightside_c`    |

For more information [check the Wiki!](https://github.com/Megaf/libsay/wiki)
