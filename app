from flask import Flask, render_template, request, redirect

app = Flask(__name__)

events = []

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        title = request.form["title"]
        date = request.form["date"]
        time = request.form["time"]
        desc = request.form["description"]

        events.append({
            "title": title,
            "date": date,
            "time": time,
            "desc": desc
        })

        return redirect("/")

    return render_template("index.html", events=events)

if __name__ == "__main__":
    app.run(debug=True)
