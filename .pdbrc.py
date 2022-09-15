import pdb

from pygments.token import (
    Comment, Error, Generic, Keyword, Name, Number, Operator, String, Token,
    Whitespace
)

TERMINAL_COLORS = {
    Token: ('', ''),
    Whitespace: ('lightgray', 'darkgray'),
    Comment: ('lightgray', 'darkgray'),
    Comment.Preproc: ('teal', 'turquoise'),
    Keyword: ('darkblue', 'blue'),
    Keyword.Type: ('teal', 'turquoise'),
    Operator.Word: ('purple', 'fuchsia'),
    Name.Builtin: ('teal', 'turquoise'),
    Name.Function: ('darkgreen', 'green'),
    Name.Namespace: ('_teal_', '_turquoise_'),
    Name.Class: ('_darkgreen_', '_green_'),
    Name.Exception: ('teal', 'turquoise'),
    Name.Decorator: ('darkgray', 'lightgray'),
    Name.Variable: ('darkred', 'red'),
    Name.Constant: ('darkred', 'red'),
    Name.Attribute: ('teal', 'turquoise'),
    Name.Tag: ('blue', 'blue'),
    String: ('brown', 'brown'),
    Number: ('darkblue', 'blue'),
    Generic.Deleted: ('red', 'red'),
    Generic.Inserted: ('darkgreen', 'green'),
    Generic.Heading: ('**', '**'),
    Generic.Subheading: ('*purple*', '*fuchsia*'),
    Generic.Prompt: ('**', '**'),
    Generic.Error: ('red', 'red'),
    Error: ('_red_', '_red_'),
}


class Config(pdb.DefaultConfig):
    sticky_by_default = True
    use_pygments = True
    colorscheme = TERMINAL_COLORS
    current_line_color = 50
    editor = 'nvim'


# Save history across sessions
# https://github.com/pdbpp/pdbpp/issues/52
def _pdbrc_init():
    import readline
    import os
    home = os.environ["HOME"]
    histfile = home + "/.pdb_history"
    try:
        readline.read_history_file(histfile)
    except IOError:
        pass
    import atexit
    atexit.register(readline.write_history_file, histfile)
    readline.set_history_length(1000)

_pdbrc_init()
del _pdbrc_init
