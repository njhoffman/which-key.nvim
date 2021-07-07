local M = {}

M.when = {
  ["wrap"] = {
    ["ze"] = "when 'wrap' off scroll horizontally to position Δ at the end (right side) of the screen",
    ["zs"] = "when 'wrap' off scroll horizontally to position Δ at the start (left side) of the screen",
    ["zH"] = "when 'wrap' off scroll half a screenwidth to the right",
    ["zL"] = "when 'wrap' off scroll half a screenwidth to the left",
    ["zh"] = "when 'wrap' off scroll screen N characters to the right",
    ["zl"] = "when 'wrap' off scroll screen N characters to the left",
  },
  ["MEM_PROFILE"] = {
    ["<C-a>"] = "only when compiled with MEM_PROFILE defined: dump a memory profile",
  },
}

M.not_used = {
  ["<C-@>"] = "not used",
  ["<C-k>"] = "not used",
  ["<C-r>"] = "not used, or used for terminal control flow",
  ["<C-q>"] = "not used, or used for terminal control flow",
  ["<C-[><Esc>"] = "not used",
  ["<C-\\>a-z"] = "reserved for extensions",
  ["<C-\\>others"] = "not used",
  ["<C-_>"] = "not used",
  ["\\"] = "not used",
}

M.not_included = {
  ["{count}<Del>"] = "remove the last digit from {count}",
  ["<Help>"] = "open a help window",
  ["z{height}<CR>"] = "redraw, make window {height} lines high",
  ["gV"] = "don't reselect the previous Visual area when executing a mapping or menu in Select mode",
  ["1"] = "prepend to command to give a count",
  ["2"] = "prepend to command to give a count",
  ["3"] = "prepend to command to give a count",
  ["4"] = "prepend to command to give a count",
  ["5"] = "prepend to command to give a count",
  ["6"] = "prepend to command to give a count",
  ["7"] = "prepend to command to give a count",
  ["8"] = "prepend to command to give a count",
  ["9"] = "prepend to command to give a count",
  ["{count}:"] = "start entering an Ex command with range from current line to N-1 lines down",
}

M.same_as = {
  ["<C-b>"] = { "<PageUp>" },
  ["<C-f>"] = { "<PageDown>" },
  ["<C-w>s"] = { "<C-w>S" },
  ["<C-w>j"] = { "<C-w><Down>" },
  ["<C-w>k"] = { "<C-w><Up>" },
  ["<C-w>h"] = { "<C-w><Left>" },
  ["<C-w>l"] = { "<C-w><Right>" },
  ["zh"] = { "z<Left>" },
  ["zl"] = { "z<Right>" },
  ["zp"] = { "ZP" },
  ["gt"] = { "<C-w>gt" },
  ["gT"] = { "<C-w>gT" },
  ["g??"] = { "g?g?" },
  ["g<Tab>"] = { "<C-Tab>", "<C-w>g<Tab>" },
  ["gf"] = { "[f", "]f" },
  ["[p"] = { "[P" },
  ["]p"] = { "]P" },
  ["i"] = { "<Insert>" },
  ["u"] = { "<Undo>" },
  ["x"] = { "<Del>" },
  ["<Help>"] = { "<F1>" },
  ["<C-w>..."] = { "<C-w><C-...>" },
}

local window_binds = {
  name = "window",
  ["+"] = "increase current window height N lines",
  ["-"] = "decrease current window height N lines",
  ["<LT>"] = "decrease current window width N columns",
  ["="] = "make all windows the same height & width",
  [">"] = "increase current window width N columns",
  ["H"] = "move current window to the far left",
  ["J"] = "move current window to the very bottom",
  ["K"] = "move current window to the very top",
  ["L"] = "move current window to the far right",
  ["P"] = "go to preview window",
  ["R"] = "rotate windows upwards N times",
  ["T"] = "move current window to a new tab page",
  ["W"] = "go to N previous window (wrap around)",
  ["]"] = "split window, jump to Δtag",
  ["^"] = "split current window, edit alternate file N",
  ["_"] = "set current window height to N (default: very high)",
  ["b"] = "go to bottom window",
  ["c"] = "close current window (like |:close|)",
  ["d"] = "split window, jump to Δdefinition",
  ["f"] = "split window, edit Δfilename",
  ["F"] = "like \"<C-w>f\", but jump to the line number after the filename",
  ["g<C-]>"] = "split window, do |:tjump| to Δtag",
  ["g]"] = "split window, do |:tselect| for Δtag",
  ["g}"] = "do a |:ptjump| to the Δtag",
  ["gf"] = "edit Δfilename in a new tab page",
  ["gF"] = "like \"<C-w>gF\", but jump to the line number after the filename",
  ["h"] = "go to Nth left window (stop at first window)",
  ["i"] = "split window, jump to declaration of Δidentifier",
  ["j"] = "go N windows down (stop at last window)",
  ["k"] = "go N windows up (stop at first window)",
  ["l"] = "go to Nth right window (stop at last window)",
  ["n"] = "open new window, N lines high",
  ["o"] = "close all but current window (like |:only|)",
  ["p"] = "go to previous (last accessed) window",
  ["q"] = "quit current window (like |:quit|)",
  ["r"] = "rotate windows downwards N times",
  ["s"] = "split current window in two parts, new window N lines high",
  ["t"] = "go to top window",
  ["v"] = "split current window vertically, new window N columns wide",
  ["w"] = "go to N next window (wrap around)",
  ["x"] = "exchange current window with window N (default: next window)",
  ["z"] = "close preview window",
  ["|"] = "set window width to N columns",
  ["}"] = "show Δtag in preview window",
}

local g_binds = {
  ["<C-g>"] = "show information about current Δ position",
  ["<C-h>"] = "start Select block mode",
  ["<C-]>"] = "|:tjump| to the Δtag",
  ["&"] = "Ψ_repeat last \":s\" on all lines",
  ["+"] = "go to newer text state N times",
  ["-"] = "go to older text state N times",
  ["8"] = "print hex value of bytes used in UTF-8 character",
  ["<LT>"] = "display previous command output",
  ["??"] = "Ψ_Rot13 encode current line",
  ["H"] = "start Select line mode",
  ["I"] = "Ψ_like \"I\", but always start in column 1",
  ["J"] = "Ψ_join lines without inserting space",
  ["P"] = "ΛΨ_put text before Δ N times, leave Δ after it",
  ["Q"] = "switch to \"Ex\" mode with Vim editing",
  ["R"] = "Ψ_enter Virtual Replace mode",
  ["T"] = "go to the previous tab page",
  ["]"] = ":tselect on the Δtag",
  ["a"] = "print ascii value of Δcharacter",
  ["f"] = "start editing Δfilename",
  ["F"] = "like \"gF\", but jump to the line number after the filename",
  ["h"] = "start Select mode",
  ["i"] = "Ψ_like \"i\", but first move to the |'^| mark",
  ["p"] = "ΛΨ_put text after Δ N times, leave Δ after it",
  ["r"] = "δΨ_virtual replace N chars with δ",
  ["s"] = "go to sleep for N seconds (default 1)",
  ["t"] = "go to the next tab page",
  ["v"] = "reselect the previous Visual area",
  ["x"] = "execute application for Δfilename (|netrw| plugin)",
  ["<Tab>"] = "go to last accessed tab page",
}

local z_binds = {
  ["<CR>"] = "redraw, Δ line to top of window, Δ on first non-blank",
  ["+"] = "like \"z<CR>\", but Δ on line N (default line below window)",
  ["-"] = "redraw, Δ line at bottom of window, Δ on first non-blank",
  ["."] = "redraw, Δ line to center of window, Δ on first non-blank",
  ["="] = "give spelling suggestions",
  ["A"] = "open a closed fold or close an open fold recursively",
  ["C"] = "close folds recursively",
  ["D"] = "delete folds recursively",
  ["E"] = "eliminate all folds",
  ["F"] = "create a fold for N lines",
  ["G"] = "temporarily mark word as correctly spelled",
  ["M"] = "set 'foldlevel' to zero",
  ["N"] = "set 'foldenable'",
  ["O"] = "open folds recursively",
  ["R"] = "set 'foldlevel' to the deepest fold",
  ["W"] = "temporarily mark word as incorrectly spelled",
  ["X"] = "re-apply 'foldlevel'",
  ["^"] = "like \"z-\", but Δ on line N (default line above window)",
  ["a"] = "open a closed fold, close an open fold",
  ["b"] = "redraw, Δ line at bottom of window",
  ["c"] = "close a fold",
  ["d"] = "delete a fold",
  ["g"] = "permanently mark word as correctly spelled",
  ["i"] = "toggle 'foldenable'",
  ["m"] = "subtract one from 'foldlevel'",
  ["n"] = "reset 'foldenable'",
  ["o"] = "open fold",
  ["p"] = "Λ_paste in block-mode without trailing spaces",
  ["r"] = "add one to 'foldlevel'",
  ["t"] = "redraw, Δ line at top of window",
  ["u"] = {
    name = "undo",
    ["w"] = "undo |zw|",
    ["g"] = "undo |zg|",
    ["W"] = "undo |zW|",
    ["G"] = "undo |zG|",
  },
  ["v"] = "open enough folds to view Δ line",
  ["w"] = "permanently mark word as incorrectly spelled",
  ["x"] = "re-apply 'foldlevel' and do \"zv\"",
  ["y"] = "Λ_yank without trailing spaces",
  ["z"] = "redraw, Δ line at center of window",
}

M.mode = {
  ["<C-\\>"] = {
    name = "mode",
    ["<C-n>"] = "go to Normal mode (no-op)",
    ["<C-g>"] = "go to mode specified with 'insertmode'",
  },
}

M.mapping = {
  ["<C-a>"] = "Ψ_add N to number at/after Δ",
  ["<C-c>"] = "interrupt current (search) command",
  ["<C-d>"] = "scroll Down N lines (default: half a screen)",
  ["<C-e>"] = "scroll N lines upwards",
  ["<C-g>"] = "display current filename and position",
  ["<C-l>"] = "redraw screen",
  ["<C-r>"] = "Ψ_redo changes which were undone with 'u'",
  ["<C-t>"] = "jump to N older Tag in tag list",
  ["<C-u>"] = "scroll N lines Upwards (default: half a screen)",
  ["<C-w>"] = window_binds,
  ["<C-x>"] = "Ψ_subtract N from number at/after Δ",
  ["<C-y>"] = "scroll N lines downwards",
  ["<C-z>"] = "suspend program (or start new shell)",
  ["<C-]>"] = ":ta to Δidentifier",
  ["<C-^>"] = "edit Nth alternate file (equivalent to \":e #N\")",
  ["!!"] = "ζ,Ψ_filter N lines through the {filter} command",
  ["&"] = "Ψ_repeat last :s",
  ["."] = "Ψ_repeat last change with count replaced with N",
  ["<LT><LT>"] = "Ψ_shift N lines one 'shiftwidth' leftwards",
  ["=="] = "Ψ_filter N lines through \"indent\"",
  [">>"] = "Ψ_shift N lines one 'shiftwidth' rightwards",
  ["@:"] = "repeat the previous \":\" command N times",
  ["@@"] = "Ψ_repeat the previous @{a-z} N times",
  ["A"] = "Ψ_append text after the end of the line N times",
  ["C"] = "ΛΨ_synonym for \"c$\" N times",
  ["D"] = "ΛΨ_synonym for \"d$\" N times",
  ["I"] = "Ψ_insert text before the first CHAR on the line N times",
  ["J"] = "Ψ_Join N lines; default is 2",
  ["K"] = "lookup ΔKeyword with 'keywordprg'",
  ["O"] = "Ψ_begin a new line above and insert text, repeat N times",
  ["P"] = "ΛΨ_put the text before Δ N times",
  ["Q"] = "switch to \"Ex\" mode",
  ["R"] = "Ψ_enter replace mode, repeat the entered text N times",
  ["S"] = "ΛΨ_synonym for \"cc\" N times",
  ["U"] = "Ψ_undo all latest changes on one line",
  ["X"] = "ΛΨ_delete N characters before Δ",
  ["Y"] = "Λ_synonym for \"yy\" N times",
  ["ZZ"] = "write if buffer changed and close window",
  ["ZQ"] = "close window without writing",
  ["["] = { name = "backward" },
  ["]"] = { name = "forward" },
  ["[<C-d>"] = "jump to first #define found matching Δword",
  ["[<C-i>"] = "jump to first line that contains Δword",
  ["[D"] = "list all defines found matching Δword",
  ["[I"] = "list all lines found that contain Δword",
  ["[d"] = "show first #define found matching Δword",
  ["[i"] = "show first line found that contains Δword",
  ["[p"] = "Ψ_like \"P\", but adjust indent to current line",
  ["]<C-d>"] = "jump to first #define found matching Δword",
  ["]<C-i>"] = "jump to first line that contains Δword",
  ["]D"] = "list all #defines found matching Δword",
  ["]I"] = "list all lines found that contain Δword",
  ["]d"] = "show first #define found matching Δword",
  ["]i"] = "show first line found that contains Δword",
  ["]p"] = "Ψ_like \"p\", but adjust indent to current line",
  ["a"] = "Ψ_append text after Δ N times",
  ["cc"] = "ΛΨ_delete N lines and start insert",
  ["dd"] = "ΛΨ_delete N lines",
  ["do"] = "Ψ_same as \":diffget\"",
  ["dp"] = "Ψ_same as \":diffput\"",
  ["g"] = g_binds,
  ["i"] = "Ψ_insert text before Δ N times",
  ["m"] = "β_set mark β at Δ position",
  ["o"] = "Ψ_begin a new line below and insert text, repeat N times",
  ["p"] = "ΛΨ_put the text after Δ N times",
  ["q"] = {
    name = "φ_record macro into φ (uppercase to append)",
    ["q"] = "(while recording) stops recording",
    [":"] = "edit : command-line in command-line window",
    ["/"] = "edit / command-line in command-line window",
    ["?"] = "edit ? command-line in command-line window",
  },
  ["r"] = "δ,Ψ_replace N chars with δ",
  ["s"] = "ΛΨ_(substitute) delete N characters and start insert",
  ["u"] = "Ψ_undo changes",
  ["x"] = "ΛΨ_delete N characters under and after Δ",
  ["yy"] = "Λ_yank N lines",
  ["z"] = z_binds,
}

M.mouse = {
  ["[<MiddleMouse>"] = "Ψ_same as \"[p\"",
  ["]<MiddleMouse>"] = "Ψ_same as \"]p\"",
  ["g<LeftMouse>"] = "same as <C-LeftMouse>",
  ["g<MiddleMouse>"] = "same as <C-MiddleMouse>",
  ["g<RightMouse>"] = "same as <C-RightMouse>",
  ["<C-LeftMouse>"] = "\":ta\" to the keyword at the mouse click",
  ["<C-RightMouse>"] = "same as \"CTRL-T\"",
  ["<LeftMouse>"] = "Ξ_move Δ to the mouse click position",
  ["<MiddleMouse>"] = "Ψ_same as \"gP\" at the mouse click position",
  ["<RightMouse>"] = "start Visual mode, move Δ to the mouse click position",
  ["<S-LeftMouse>"] = "same as \"*\" at the mouse click position",
  ["<S-RightMouse>"] = "same as \"#\" at the mouse click position",
  ["<ScrollWheelDown>"] = "move window three lines down",
  ["<S-ScrollWheelDown>"] = "move window one page down",
  ["<ScrollWheelUp>"] = "move window three lines up",
  ["<S-ScrollWheelUp>"] = "move window one page up",
  ["<ScrollWheelLeft>"] = "move window six columns left",
  ["<S-ScrollWheelLeft>"] = "move window one page left",
  ["<ScrollWheelRight>"] = "move window six columns right",
  ["<S-ScrollWheelRight>"] = "move window one page right",
}

return M
