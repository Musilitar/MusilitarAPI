"""Musilitar API - Deploy"""
import hug
from subprocess import call
from falcon import HTTP_200


@hug.call("/deploy", ["POST"], versions=1)
def docs(response):
    """Trigger a deployment of the application"""
    call(["git pull"])
    response.status = HTTP_200
