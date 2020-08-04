import requests


class Py3status:

    def bitcoin(self):
        rr = requests.get("https://blockchain.info/ticker")
        data = rr.json()
        return {
            'full_text': "${}".format(
                data['USD']['last']
            ),
            #'full_text': "${}, ${:.2f}, ${:.2f}".format(
            #    data['USD']['last'],
            #    data['USD']['last'] * 0.27485289,
            #    data['USD']['last'] * 0.27485289 * 140
            #),
            'cached_until': self.py3.time_in(300)
        }

