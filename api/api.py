import hug

from db import db

from doc import doc
from deploy import deploy
from serve import serve
from auth import auth


hug.API(__name__).http.output_format = hug.output_format.pretty_json


@hug.startup()
def startup(api):
    db.initialize_database()


@hug.extend_api()
def apis():
    return [doc, deploy, serve, auth]
