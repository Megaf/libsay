`COMMANDS.md - version 1.2-202209.28.171000`
# libsay

This is a brief overview of the commands available in the `libsay` library.

Commands provided by importing libsay to your shell or project.

## "say"
### General Usage

|Command              |Argument       |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`say`                |"string"       |Draws lines around text and formats it. From string, pipe or var. |`say "Hi`,`echo "Hi" | say`,`say file.txt` |
|`say --colour`       |"colour"       |Same as above, but with the desired colour.                       |`say --colour green "Hello There"`         |
|`say --bg-colour`    |"colour"       |Same as above, but with the desired background colour.            |`say --bg-colour cyan "Hello There"`       |
|`say --align`        |"alignment"    |Same as above, but with the desired colour and text alignment.    |`say --colour green --align right "Hello!"`|

### Help Commands
Each "help command" will list and print examples.

Type `say "command"`

|Command              |Argument       |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`list_colours`       |none           |See all the available foreground colours.                         |`say list_colours`                         |
|`list_colours_bg`    |none           |See all the available background colours.                         |`say list_colours_bg`                      |
|`list_weights`       |none           |See all the available text weight options.                        |`say list_weights`                         |
|`list_aligns`        |none           |See all the available text alignment options.                     |`say list_aligns`                          |
|`list_border_colours`|none           |See all the available border colours. It only sets the foreground.|`say list_border_colours`                  |
|`list_border_styles` |none           |See all the available border styles.                              |`say list_border_styles`                   |
|`list_draw_elements` |none           |Prints all the built-in symbols in the draw command.              |`saw list_draw_elements`                   |

## "set_colour"
### Setting Colours

|Command              |Argument       |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`set_colour`         |none           |Returns the available colours.                                    |`set_colour`                               |
|`set_colour fg`      |"colour"       |Sets the foreground colour to the desired colour.                 |`set_colour "fg" "light_blue"; echo "Hi"`  |
|`set_colour bg`      |"colour"       |Sets the background colour to the desired colour.                 |`set_colour "bg" "black"; echo "Hi"`       |
|`set_border_colour`  |none           |With `say`, colours the box borders from `$border_colour` var.    |`border_colour=light_cyan say "Hello!"`    |

## Manipulating Text

Commands to manipulate the terminal's text.

|Command              |Argument       |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`symbol_repeat`      |"char" "count" |Repeats a character a certain amount of times.                    |`symbol_repeat "_" "4"`                    |
|`rst`                |none           |Resets terminal's text style, effects and colours to the default. |`rst`                                      |

## Text Effects

Commands that will apply effects to text.

|Command              |Argument       |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`underline_on`       |none           |Underlines text after the command.                                |`underline_on; echo "Hello There!"`        |
|`wavy_underline_on`  |none           |Underlines text with a squiggly underline after the command.      |`wavy_underline_on; echo "Squiggly!"`      |
|`double_underline_on`|none           |Same as above, but with a double line instead.                    |`double_underline_on; echo "Greetings"`    |
|`overline_on`        |none           |Adds a line above the text, underline but overline.               |`overline_on; echo "I'm overlined."`       |
|`overunder_on`       |none           |Adds an underline and an overline.                                |`overunder_on; echo "Above and below"`     |
|`overuwavynder_on`   |none           |Adds a squiggly underline and an overline.                        |`overuwavynder_on; echo "Above and wavy"`  |
|`bold_on`            |none           |Prints the text in bold.                                          |`bold_on; echo "hi"`/`weight=bold say "hi"`|
|`invert_on`          |none           |Makes the background colour the foreground and vice versa.        |`invert_on; echo "Hello Inverted There!"`  |
|`blink_on`           |none           |Makes text blink.                                                 |`blink_on; echo "I'm a blinking text"`     |
|`italics_on`         |none           |Writes the text in Italics.                                       |`italics_on; echo "e l e g a n t  t e x t"`|
|`crossout_on`        |none           |Strikes-through text.                                             |`crossout_on; echo "A mistake perhaps."`   |
|`fade_on`            |none           |Makes the text less intense.                                      |`fade_on; echo "Not a very bright string."`|

### Turning text effects off individually.

Some text effect can be individually turned off.

|Command              |Argument       |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`underline_off`      |none           |Disables wavy/squiggly and (double)underline.                     |`underline_off; echo "Underline disabled"` |
|`bold_off`           |none           |Disables bold text and faded/dim.                                 |`bold_off; echo "Text in normal weight."`  |
|`fade_off`           |none           |Disabled faded/dim and bold text.                                 |`fade_off; echo "Text in normal weight."`  |
|`invert_off`         |none           |Disables inverted text.                                           |`invert_off; echo "Colours not inverted"`  |
|`blink_off`          |none           |Disables blinking text effect.                                    |`blink_off; echo "Static text"`            |
|`italics_off`        |none           |Disables italics text.                                            |`italics_off; echo "Text not in italics"`  |
|`crossout_off`       |none           |Disables strike-through/cross-out text.                           |`crossout_off; echo "Free text."`          |
|`fg_colour_off`      |none           |Sets text colour to terminals default.                            |`fg_colour_off; echo "Default colour."`    |
|`bg_colour_off`      |none           |Sets text background colour to terminals default.                 |`bg_colour_off; echo "Default colour."`    |

## Default Styles

Apply pre defined styles.

|Command              |Argument       |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`c_error`            |none           |Uses colour scheme and text effect for "Error" messages.          |`c_error; echo "An Error occurred."; rst`  |
|`c_info`             |none           |Uses colour scheme and text effect for "Info" messages.           |`c_info; echo "Piece of Information"; rst` |
|`c_warning`          |none           |Uses colour scheme and text effect for "Warning" messages.        |`c_warning; echo "Warning! You Sure?"; rst`|
|`c_debug`            |none           |Uses colour scheme and text effect for "Debug" messages.          |`c_debug; echo "DEBUG: Lot's of Info"; rst`|
|`c_notice`           |none           |Uses colour scheme and text effect for "Notice" messages.         |`c_notice; echo "Notice about this."; rst` |
|`c_title`            |none           |Uses colour scheme and text effect for "Title" messages.          |`c_title; echo "This Is The Title"; rst`   |
|`c_normal`           |none           |Uses colour scheme and text effect for "Normal" messages.         |`c_normal; echo "Just a perfect day."; rst`|

## "draw"

### Drawing shapes

|Command              |Argument       |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`draw`               |"part_name"    |draws pre defined shapes. See `say say list_draw_elements`        |`draw leftside_c line line rightside_c`    |

## libsay environment variables:

You can also set a number of features in libsay through variables.

### Environment variables

|Variable             |Value          |Description                                                       |Example                                    |
|---------------------|---------------|------------------------------------------------------------------|-------------------------------------------|
|`colour`             |"colour_name"  |Sets foreground colour. `say list_colours` to see colours list.   |`colour=cyan say "Text is set to cyan!"`   |
|`bg_colour`          |"colour_name"  |Sets background colour. `say list_colours_bg` to see colours list.|`bg_colour=red say "Background is red!"`   |
|`align`              |"alignment"    |Aligns text. `say list_aligns` to see alignments.                 |`align=right say "Aligned to the right"`   |
|`weight`             |"font_weight"  |Sets font "weight". `say list_weights` to see available weights.  |`weight=bold say "You are the bold on!"`   |
|`minimal_size`       |"number"       |Defines the minimal box internal width.                           |`minimal_size=10 say "12 columns wide."`   |
|`border_colour`      |"colour_name"  |Set's box lines/border colour. See `say list_border_colours`.     |`border_colour=red say "It's a red box"`   |
|`style`              |"style_name"   |Set's box lines/border style. See `say list_border_styles`.       |`style=boxsingleline say "Single line!"`   |
|`debug`              |"boolean"      |If `debug=true` it will print debug messages from your script.    |`debug=true say "DEBUG: Debug is true:"`

For more information [check the Wiki!](https://github.com/Megaf/libsay/wiki)
