"""Musilitar API - Serve"""
import os.path
import hug


@hug.static("/static")
def static():
    """Serves static files"""
    path = os.path.join(os.path.dirname(__file__), "../../static")
    return (path,)

@hug.get("/", output=hug.output_format.html)
def home():
    """Serves the home application"""
    path = os.path.join(os.path.dirname(__file__), "../../static/home/index.html")
    with open(path) as file:
        return file.read()

@hug.get("/array", output=hug.output_format.html)
def array():
    """Serves the array application"""
    path = os.path.join(os.path.dirname(__file__), "../../static/array/index.html")
    with open(path) as file:
        return file.read()