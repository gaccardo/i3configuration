import os
import requests
import pickle


class Py3status:

    def __init__(self):
        self.on_click(None)

    def __storage_get(self):
        if not os.path.exists("/tmp/bitcoin.p"):
            self.__storage_set(0)
            return {"value": 0}
        value = pickle.load(open("/tmp/bitcoin.p", "rb"))
        return value

    def __storage_set(self, value):
        value = {"value": int(value)}
        pickle.dump(value, open("/tmp/bitcoin.p", "wb"))

    def on_click(self, event):
        rr = requests.get("https://blockchain.info/ticker")
        data = rr.json()
        #data = {'USD': {'last': 1.0}}
        stored_index = self.__storage_get()['value']
        return_list = [
            "btc p: ${:.2f}".format(data['USD']['last']),
            "btc c: ${:.2f}".format(data['USD']['last'] * 0.27485289),
            "btc cp: ${:.2f}".format(data['USD']['last'] * 0.27485289 * 127)
        ]
        if stored_index == 2:
            self.__storage_set(0)
        if stored_index >= 0 and stored_index < 2:
            self.__storage_set(stored_index+1)

        self.full_text = return_list[stored_index]

    def bitcoin(self):
        return {
            'full_text': self.full_text,
            'cached_until': self.py3.time_in(300),
        }


if __name__ == "__main__":
    config = {
        'always_show': True,
    }
    from py3status.module_test import module_test
    module_test(Py3status, config=config)
