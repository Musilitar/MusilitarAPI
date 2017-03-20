"""Musilitar API"""
import hug

from doc import  doc
from home_event import home_event
from work_event import work_event


hug.API(__name__).http.output_format = hug.output_format.pretty_json


@hug.extend_api()
def apis():
    return [doc, home_event, work_event]
