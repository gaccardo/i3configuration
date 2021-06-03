import os
import requests
from requests.auth import HTTPBasicAuth
from datetime import datetime


KEY="Z0iADxxUqBc5kRcV7l7heRiELyBJJkSNakqN91yBaoFxDDHObeofOm/v/BRZsjJeCjOVt6cPmCvQ99g1"
SECRET="tIEIGWu4TZ/ePr5PDlYLlB7gtSV/O2WKWipraXTfeRYdiGa/11AgtbHzP1LxzFQb7etD925aD/drnOY5"
DEST="/tmp"
HOST="fw01.starfleet.local"


if __name__ == "__main__":
    today = datetime.now()
    today = datetime.strftime(today, "%Y%M%d")
    auth = HTTPBasicAuth(KEY, SECRET)

    with requests.get(
        f"https://{HOST}/api/backup/download",
        stream=True,
        auth=auth) as r:
        r.raise_for_status()
        with open(os.path.join(DEST, f"{today}-{host}.xml"), "wb") as f:
            for chunk in r.iter_content(chunk_size=8192):
                f.write(chunk)
