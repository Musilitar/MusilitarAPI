"""Musilitar API - Deploy"""
import hug
from subprocess import call


@hug.call("/deploy", ["POST"], versions=1)
def docs():
    """Trigger a deployment of the application"""
    call(["git pull"])
    return {"status": "deployed"}
