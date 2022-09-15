# libsay
## About:
`libsay` is a library, it can be added to your shell and used directly or
easily imported to you console based project to provide some nice and colourfull
text output to the users of your projects. All without changing your code!

## Examples:
`say lines.txt`

![image](https://user-images.githubusercontent.com/6201512/190273332-364163d1-61b3-4c9f-bcab-3d8b05a69dc2.png)

`say "Hello there!`

![image](https://user-images.githubusercontent.com/6201512/190273389-6e548ac5-b99a-4054-b796-a0ecba5b228b.png)

`uname -s -r -o | say`

![image](https://user-images.githubusercontent.com/6201512/190273639-04667347-b2ae-4738-8aeb-ce2eef68e9cc.png)

Automagically parsing text:

![image](https://user-images.githubusercontent.com/6201512/190273818-5794f8c1-97f1-4a7a-b030-d7ffcd5baa6c.png)

### Adding to your shell
`libsay` will provide new commands to your shell.
For example, the command `say`. It prints text given to it.
You can do `say "Hello world!` and the output will be:

![image](https://user-images.githubusercontent.com/6201512/190270607-652233d7-dc67-40ba-845c-ead2208de2cc.png)

1. Simply download the `libsay` library and save it to somewhere safe in your system, for example, `~/.local/lib/`.
2. Load the lib at login by adding it to your `.bashrc`. Add at the end, for example, `source ~/.local/lib/libsay`.
3. Just load it to your current terminal without changing anything else. `source libsay`.

#### What it adds to your shell
`libsay` can do a lot more than `say`. It will add the following commands:
1. `say` -> Adds a nice border around the text.
2. `draw` -> Allows you to "draw" lines and corners.
   - Available commands in `draw`:
     - `topleftcorner`, `top`, `toprightcorner`, `rightside`, `leftside`, `bottomleftcorner`, `bottom`, `bottomrightcorner`
     - Check the documentation for the full list.
3. `set_colour fg/bg` -> You can change the colour of your foreground and back ground.
   - `set_colour fg "colour"` -> For example, `set_colour fg blue` to change text colour to blue.
   - `set_colour bg "colour"` -> For example, `set_colour bg white` to change the text background to white.
     - Example:
       - `set_colour fg red; echo "This text will be in red."; rst`
       - `set_colour bg blue; set_colour fg white; echo "This text will be in white with a blue background."; rst`
4. `rst` -> Resets the colours and style to your shells default.
5. Preformatted styles -> `libsay` comes with some pre selected colour schemes schemes for some types of messages.
   - `c_debug`, `c_error`, `c_info`, `c_warning`. These are used by `say` as well when reading your input.
     - Example: `c_error; echo "This text is using the error scheme. Text in red, underlined, with black background."; rst`

There's a lot more! Check the docs!

### Adding to your project
When you have libsay in your project, and you want highlight for error, warning, information, notices and debug messages, all you have to do is start the messages with either, `ERROR:`, `INFO:`, `WARN:/WARNING`, `DEBUG:`, or `NOTICE` and instead of using `echo` or `printf` you use `say`.
Just add to the top of your code, `source libsay` and you will be good to go.

# UNDER CONSTRUCTION.
## More to come.
