import os
import subprocess


class Py3status:

    def kx(self):
        home = os.environ.get("HOME")
        config_path = os.path.join(home, ".kube/config")
        with open(config_path, "r") as kube_config:
            lines = kube_config.readlines()
        for line in lines:
            if "current-context" in line:
                out = line.split(": ")[1].split(".")[0].split("@")[-1]

        return {
            'full_text': out,
            'cached_until': self.py3.time_in(5)
        }
