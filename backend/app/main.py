from flask import Flask
import serial

bt = serial.Serial("/dev/rfcomm0", 9600)

app = Flask(__name__)


@app.route("/move/<cmd>")
def move(cmd):

    mapping = {
        "forward": b"F",
        "backward": b"B",
        "left": b"L",
        "right": b"R",
        "stop": b"S",
    }

    if cmd in mapping:
        bt.write(mapping[cmd])
        return f"Sent {cmd} to Arduino via HC-05"
    else:
        return "Invalid command", 400


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
