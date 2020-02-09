import os
import configparser


class Py3status:

    def __get_current_profile(self):
        home = os.environ.get("HOME")
        config = configparser.ConfigParser()
        config.read('{}/.aws/credentials'.format(home))

        return str(config.get("default", "name"))

    def awx(self):
        return {
            'full_text': self.__get_current_profile(),
            'cached_until': self.py3.time_in(5)
        }

