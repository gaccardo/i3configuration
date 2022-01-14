import glob
import os.path

c.aliases = {
        'q': 'quit',
        'w': 'session-save',
        'wq': 'quit --save',
        'x': 'quit --save',
        'h': 'help'
        }

c.confirm_quit = ['downloads']
c.new_instance_open_target = 'tab-silent'
c.new_instance_open_target_window = 'last-focused'
c.auto_save.session = True

c.url.searchengines = {
        'ap': 'https://archlinux.org/packages/?q={}',
        'aur': 'https://aur.archlinux.org/packages.php?K={}',
        'ar': 'https://wiki.archlinux.org/?search={}',
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'gi': 'https://github.com/search?q={}',
        'wikt': 'https://en.wiktionary.org/wiki/Special:Search?search={}',
        'wi': 'https://en.wikipedia.org/wiki/Special:Search?search={}',
        'yo': 'https://youtube.com/results?search_query={}'
        }

c.fonts.default_family = "Envy Code R"

config.bind("xb", "config-cycle statusbar.hide")
config.bind("xt", "config-cycle tabs.show always switching")
config.bind("xx", "config-cycle statusbar.hide ;; config-cycle tabs.show always switching")

config.load_autoconfig()
