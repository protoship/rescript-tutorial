@bs.val external document: {..} = "document"

let root = document["getElementById"]("root")
root["innerHTML"] = "<h1>Hello, world!</h1>"

let body = document["body"]
body["style"]["backgroundColor"] = "#222831"
body["style"]["color"] = "#eeeeee"
