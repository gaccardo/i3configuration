import subprocess


class Py3status:

    def docker(self):
        output = subprocess.Popen(
                ["free", "-m"],
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT
        )
        stdout, stderr = output.communicate()
        out = str(stdout)
        out = [x for x in out.split(" ") if x]
        total = float(out[7])
        used = float(out[8])
        used_percent = used * 100 / total
        return {
            'full_text': 'MEM: {:.2f} %'.format(used_percent),
            'cached_until': self.py3.time_in(20)
        }


if __name__ == "__main__":
    py = Py3status()
    print(py.docker())
