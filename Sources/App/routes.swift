import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Серверная часть проекта Shop"])
    }

    app.get("status") { req -> String in
        return "Серверная часть проекта Shop запущена и доступна ✅"
    }
}
