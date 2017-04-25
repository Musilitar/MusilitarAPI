"""Musilitar API"""
import hug

from doc import doc
from deploy import deploy
from serve import serve


hug.API(__name__).http.output_format = hug.output_format.pretty_json


@hug.extend_api()
def apis():
    return [doc, deploy, serve]
