import os
from bs4 import BeautifulSoup
import requests


class Py3status:

    def ethereum(self):
        r = requests.get("https://ethereumprice.org/")
        raw_html = r.content
        soup = BeautifulSoup(raw_html, 'html.parser')
        raw_price = soup.select('span.value')[0].text
        price = float(raw_price.replace(",", ""))
        return {
            'full_text': "${:.2f}".format(price),
            'cached_until': self.py3.time_in(300),
        }


if __name__ == "__main__":
    config = {
        'always_show': True,
    }
    from py3status.module_test import module_test
    module_test(Py3status, config=config)
