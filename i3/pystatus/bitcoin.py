import os
import requests
import pickle


class Py3status:

    def bitcoin(self):
        rr = requests.get("https://blockchain.info/ticker")
        data = rr.json()
        full_text = "${:.2f}".format(data['USD']['last'])
        return {
            'full_text': full_text,
            'cached_until': self.py3.time_in(300),
        }


if __name__ == "__main__":
    config = {
        'always_show': True,
    }
    from py3status.module_test import module_test
    module_test(Py3status, config=config)
