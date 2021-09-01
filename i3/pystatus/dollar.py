import AdvancedHTMLParser
import requests


class Py3status:

    def __get_dollar_price(self):
        html = requests.get("https://dolarhoy.com/")
        parser = AdvancedHTMLParser.AdvancedHTMLParser()
        parser.parseStr(html.text)
        values = parser.getElementsByClassName("val")
        comprador = values[0].text
        vendedor = values[1].text

        return f"{comprador} {vendedor}"

    def dollar(self):
        return {
            'full_text': self.__get_dollar_price(),
            'cached_until': self.py3.time_in(600)
        }


if __name__ == "__main__":
    pp = Py3status()
    print(pp.dollar())
